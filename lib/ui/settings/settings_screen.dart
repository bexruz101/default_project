import 'package:default_project/ui/settings/widgets/button.dart';
import 'package:easy_localization/easy_localization.dart';
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
        title: Text(tr('Settings')),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 36,),
              Button(text: tr("Choose_youth_language"), a: 1),
              SizedBox(height: 36,),
              Button(text: tr("Notification"), a: 2),
              SizedBox(height: 36,),
              Button(text:tr("Update_version"), a: 2),

          ],
        ),
      ),
    );
  }
}
