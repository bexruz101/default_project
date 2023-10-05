import 'package:default_project/domain/bloc/user_bloc.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider(
        create: (_)=>UserCubit(),
        child: const HomeScreen(),
        dispose: (context,value)=>value.close(),
        )
    );
  }
}
