import 'package:contact_app/core/constants/app_colors.dart';
import 'package:contact_app/view_model/cubit/contact_cubit.dart';
import 'package:contact_app/view_model/cubit/contact_states.dart';
import 'package:contact_app/views/contacts/widgets/custom_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/widgets/custom_floating_button.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('contacts'),
      ),
      body: BlocConsumer<ContactCubit,ContactStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ContactCubit.get(context);
          return (cubit.contacts.isNotEmpty)?
           ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
               CustomItemBuilder(model:cubit.contacts[index] ),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 10),
              itemCount: cubit.contacts.length
          ):const SizedBox();
        },
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
