import 'package:default_project/local/shared_repository.dart';
import 'package:default_project/ui/tap_box/tap_box_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              onChanged: (value){
                value.isNotEmpty?StorageRepository.putString('Name', value):StorageRepository.putString('Name', '');
              },
              decoration: InputDecoration(
                hintText: 'Name',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            TextField(
              onChanged: (value){
                value.isNotEmpty?StorageRepository.putString('Password', value):StorageRepository.putString('Password', value);
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            TextButton(onPressed: (){
              StorageRepository.getString('Name')==''||StorageRepository.getString('Password')==''?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Empty'))):Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return TapBox();
              }));
            }, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}

