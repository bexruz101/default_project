import 'package:default_project/ui/settings/widgets/button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 36,),
              Button(text: 'App language', a: 1),
              SizedBox(height: 36,),
              Button(text: 'Notification', a: 2),
              SizedBox(height: 36,),
              Button(text: 'Update version', a: 2),

          ],
        ),
      ),
    );
  }
}
