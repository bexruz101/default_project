import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/update_contact/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.contacts,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
