import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'contact_states.dart';

class ContactCubit extends Cubit<ContactStates>{
  ContactCubit():super(InitContactState());

  static ContactCubit get(context)=> BlocProvider.of(context);


  Database? database ;

  void createDatabase()async{
    database =await openDatabase(
        'contact.db',
        version: 1 ,
        onCreate: (database,version){
          database.execute(
              'create table contacts('
                  'id integer primary key,name text,phone text,email text,web_site text)')
              .then((value){
            debugPrint('contacts table creating');
          }).catchError((error){
            debugPrint('error on creating table${error.toString()}');
          });
          debugPrint('contacts database created');
        },
        onOpen: (database){
          getDatabase(database);
          debugPrint('contacts database opened');
        }
    );
  }

  Future insertDatabase({
    required String name,
    required String phone ,
    required String email ,
    required String webSite ,
  }){
    return database!.transaction((txn){
      return txn.rawInsert(
          'insert into contacts (name,phone,email,web_site) values '
              '("$name","$phone","$email","$webSite")')
          .then((value){
            getDatabase(database);
        emit(AddContactSuccessState());
        debugPrint('$value insert success');
      }).catchError((error){
        debugPrint('error on insert table${error.toString()}');
        emit(AddContactErrorState());
      }) ;
    });
  }

  List<Map<String,dynamic>> contacts =[];
  Future getDatabase(database)async{
    contacts = await database!.rawQuery(
        'select * from contacts');
    debugPrint(contacts.toString());
    emit(GetAllContactState());
  }



  Future updateDatabase({
    required int id ,
    required String name,
    required String phone,
    required String email,
    required String website,
  })async{
    await database!.rawUpdate(
      'UPDATE contacts SET name = ? ,phone = ?,email =?,web_site = ?'
          'WHERE id = ?',
      [name,phone,email,website,'$id'],
    ).then((value){
      debugPrint('update contacts  done');
      getDatabase(database);
      emit(UpdateContactState());
    }).catchError((error){
      debugPrint('Error when update contacts database$error');
    });
  }

  Future deleteDatabase({required int id})async{
    await database!
        .rawDelete('DELETE FROM contacts WHERE id = $id ',
    ).then((value){
      getDatabase(database);
      emit(DeleteContactState());
    }).catchError((error){
      debugPrint('error when delete contact :$error');
    });
  }
}