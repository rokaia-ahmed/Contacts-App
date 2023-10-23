import 'package:contact_app/core/constants/app_colors.dart';
import 'package:contact_app/core/helper/validation.dart';
import 'package:contact_app/view_model/cubit/contact_cubit.dart';
import 'package:contact_app/view_model/cubit/contact_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routs/app_routs.dart';
import '../../../core/widgets/custom_default_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({super.key,required this.isEdit,
     this.model });
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bool isEdit ;
  final Map<String,dynamic>? model;
  @override
  Widget build(BuildContext context) {
    if(isEdit){
      nameController.text =model!['name'];
      phoneController.text =model!['phone'];
      emailController.text =model!['email'];
      websiteController.text =model!['web_site'];
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                   CircleAvatar(
                    radius: 50,
                    backgroundImage:const AssetImage('assets/images/img.png') ,
                    backgroundColor: AppColors.primaryColor,
                    child: InkWell(
                      onTap:(){} ,
                        child: const Icon(Icons.camera_alt)),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: nameController,
                    hintText: 'name',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validate(value!);
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: 'phone',
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone,
                    validator: (value) {
                      return validatePhone(value!);
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'email',
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: websiteController,
                    hintText: 'web site',
                    keyboardType: TextInputType.text,
                    icon: Icons.web_sharp,
                  ),
                  const SizedBox(height: 60),
                  BlocConsumer<ContactCubit, ContactStates>(
                    listener: (context, state) {
                      if(state is AddContactSuccessState ||
                         state is UpdateContactState){
                        Navigator.pushNamed(context,
                            Routes.contacts);
                      }
                    },
                    builder: (context, state) {
                      var cubit = ContactCubit.get(context);
                      return CustomDefaultButton(
                        onPressed: () {
                          if(isEdit){
                          if(formKey.currentState!.validate()){
                            cubit.updateDatabase(
                                id: model!['id'],
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                website: websiteController.text) ;
                          }
                          }else{
                            if (formKey.currentState!.validate()) {
                              cubit.insertDatabase(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                webSite: websiteController.text,
                              );
                            }
                          }
                        },
                        text:isEdit==true?
                        'update': 'save',);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
