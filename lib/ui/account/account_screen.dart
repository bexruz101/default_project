import 'package:default_project/ui/widgets/global_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/input_text.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(tr('Account')),
        centerTitle: true,

      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
                SizedBox(height: 36,),
                InputText(mainText: tr("Old_Password"), hintText:  tr("Old_Password"), type: TextInputType.text),
                SizedBox(height: 16,),
                InputText(mainText: tr("New_Password"), hintText: tr("New_Password"), type: TextInputType.text),
                SizedBox(height: 16,),
                InputText(mainText: tr("Confirm_Password"), hintText: tr("Confirm_Password"), type: TextInputType.text),
                SizedBox(height: 24,),
                GlobalButton(),
            ],

          ),
        ),
      ),
    );
  }
}
