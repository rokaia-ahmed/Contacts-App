import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routs/app_routs.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: const Icon(Icons.list_rounded,
              size: 70,
            ),
            onTap:(){
              Navigator.pushNamed(context,Routes.contacts);
            } ,
          ),
          const Text('let\'s  add friends numbers here'),
          const SizedBox(height: 10),
          const Text('welcome',
            style:TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ) ,
          ),
        ],
      ),
    ) ;
  }
}
