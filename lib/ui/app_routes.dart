import 'dart:js';

import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/home/second_screen.dart';
import 'package:default_project/ui/home/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String inital = '/';
  static const String secondScreen = '/second';
  static const String thirdScreen = '/third';
}

class AppRoutes{
  static Route generate(RouteSettings setting){
    switch(setting.name){
      case RouteNames.inital: return MaterialPageRoute(builder: (context)=>HomeScreen());
      case RouteNames.secondScreen:return MaterialPageRoute(builder: (context)=>SecondScreen(arg: setting.arguments as Map,));
      case RouteNames.thirdScreen:return MaterialPageRoute(builder: (context)=>ThirdScreen(arg: setting.arguments as Map<dynamic,dynamic>,));
      default:return MaterialPageRoute(builder: (context)=>Scaffold(body: Center(child: Text('ss'),),));
    }

  }
}