import 'package:default_project/data/my_repository.dart';
import 'package:default_project/local/shared_repository.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isTap = true;
  int len = StorageRepository.getString('Password').length ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text('Login: ${StorageRepository.getString('Name')}'),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
            Text('Password: ${isTap?StorageRepository.getString('Password'):'*'*len}'),
            IconButton(onPressed: (){
              setState(() {});
              isTap = !isTap;
    }, icon: Icon(isTap?Icons.visibility:Icons.visibility_off))
    ],
    ),
    Spacer(),
    ElevatedButton(onPressed: (){
      setState(() {
        StorageRepository.deleteString('Name');
        StorageRepository.deleteString('Password');
        len = 0;
      });

    }, child: Center(
    child: Text('Log out'),))
          ],
        ),
      ),
    );
  }
}
