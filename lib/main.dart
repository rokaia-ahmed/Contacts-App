import 'package:contact_app/core/routs/app_routs.dart';
import 'package:contact_app/view_model/cubit/contact_cubit.dart';
import 'package:contact_app/views/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit()
        ..createDatabase(),
      child:  MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute:AppRoutes.onGenerateRoute,
        home:  const HomeScreen(),
      ),
    );
  }
}

