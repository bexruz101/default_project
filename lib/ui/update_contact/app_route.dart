import 'package:default_project/ui/account/acoount_screen.dart';
import 'package:default_project/ui/add_contact/add_contact_screen.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String contacts = "/";
  static const String addContact = "/add_contact";
  static const String contactDetails = "/contact_details";
  static const String contactUpdate = "/home_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.contacts:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.addContact:
        return MaterialPageRoute(builder: (context) {
          return AddScreen(
            listener: settings.arguments as VoidCallback,
          );
        });
      case RouteNames.contactUpdate:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.contactDetails:
        return MaterialPageRoute(builder: (context) {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          return AccountScreen(
            deleteListener: map["deleteListener"],
            aaa: map["aaa"],
          );
        });
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}