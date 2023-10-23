
import 'package:contact_app/views/add_contact/screens/add_contact_screens.dart';
import 'package:contact_app/views/contacts/screens/contacts_screen.dart';
import 'package:flutter/material.dart';

import '../../views/home/screens/home_screen.dart';
import '../constants/app_strings.dart';

class Routes {
  static const String home = '/';
  static const String addContact = '/addContact';
  static const String contacts = '/contacts';
}
class ScreenArgument{
  bool isEdite ;
  Map<String,dynamic>? model ;
  ScreenArgument( this.isEdite,{this.model});
}

//? this used with generated Route
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments ;
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.addContact:
        return MaterialPageRoute(
          builder: (context) {
            ScreenArgument argument = args as ScreenArgument;
            return AddContactScreen(
                isEdit: argument.isEdite ,
                model:argument.model ,
            );
           } ,
        );
      case Routes.contacts:
        return MaterialPageRoute(
          builder: (context) =>  const ContactsScreen(),
        );
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}