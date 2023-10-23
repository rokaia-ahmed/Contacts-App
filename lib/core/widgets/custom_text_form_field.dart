import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    this.controller, this.validator,
    this.hintText, this.icon, this.keyboardType});

  final TextEditingController? controller ;
  final String? Function(String?)? validator ;
  final String? hintText ;
  final IconData? icon ;
  final TextInputType? keyboardType ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator: validator,
      maxLines: 1,
      cursorColor:AppColors.primaryColor ,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon:Icon(icon,
        color: AppColors.grayColor,
        ) ,
        iconColor: AppColors.primaryColor ,
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color:
            AppColors.primaryColor)
        ) ,
      ),
    );
  }
}
