import 'package:default_project/ui/widgets/global_button.dart';
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
        title: Text('Account'),
        centerTitle: true,

      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
                SizedBox(height: 36,),
                InputText(mainText: 'Old Password', hintText: 'Old Password', type: TextInputType.text),
                SizedBox(height: 16,),
                InputText(mainText: 'New Password', hintText: 'New Password', type: TextInputType.text),
                SizedBox(height: 16,),
                InputText(mainText: 'Confirm Password', hintText: 'Confirm Password', type: TextInputType.text),
                SizedBox(height: 24,),
                GlobalButton(),
            ],

          ),
        ),
      ),
    );
  }
}
