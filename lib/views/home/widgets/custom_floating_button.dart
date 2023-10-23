import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/routs/app_routs.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () {
        Navigator.pushNamed(
            context, Routes.addContact,
         arguments:ScreenArgument(false)
        );
      },
      child:const Icon(Icons.add) ,
    ) ;
  }
}
