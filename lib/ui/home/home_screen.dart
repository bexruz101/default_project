import 'package:flutter/material.dart';

import '../app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Default screen'),),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, RouteNames.secondScreen,arguments:{'fruits':['olma','nok'],'vegetables':['kartoshka','pomidor']});
            }, child: Text('First'))
          ],
        ),
      ),
    );
  }
}
