import 'package:contact_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({super.key,
    required this.onPressed, required this.text});
 final Function() onPressed ;
 final String text ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(horizontal: 20,
        vertical: 15,
        ) ,
        backgroundColor: AppColors.primaryColor,
      ),
        onPressed: onPressed,
        child: Text(text,
          style:const TextStyle(
            fontSize: 18,
          ) ,
        ),
    );
  }
}
