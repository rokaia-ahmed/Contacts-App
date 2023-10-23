import 'package:contact_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_floating_button.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Contact App'),
      ),
      body: const HomeBody(),
      floatingActionButton:
      const CustomFloatingButton(),
    );
  }
}
