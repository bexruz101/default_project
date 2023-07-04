import 'package:default_project/model/contact_model.dart';
import 'package:default_project/ui/add_contact/widgets/input_wid.dart';
import 'package:flutter/material.dart';

import '../../data/db/local_database.dart';
import '../utils/colors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<ContactModelSql> contacts = [];

  _updateContacts() async {
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  @override
  void initState() {
    _updateContacts();
    super.initState();
  }

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerSurname = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add'),
        actions: [
          IconButton(onPressed: (){
            LocalDatabase.insertContact(ContactModelSql(phone: _controllerPhone.text, surname:_controllerSurname.text, name: _controllerName.text));
            _updateContacts();
            Navigator.pop(context);
            }, icon: const Icon(Icons.done)),
        ],
      ),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name'),
              SizedBox(height: 10,),
              TextField(
                controller: _controllerName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:AppColors.C_9E9E9E)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:AppColors.C_9E9E9E)
                    ),
                    hintText: 'Enter name',
                    hintStyle:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.C_9E9E9E,
                    )
                ),
              )
            ],
          ),
        ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Surname'),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _controllerSurname,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:AppColors.C_9E9E9E)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:AppColors.C_9E9E9E)
                        ),
                        hintText: 'Enter Surname',
                        hintStyle:TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_9E9E9E,
                        )
                    ),
                  )

                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone number'),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _controllerPhone,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:AppColors.C_9E9E9E)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:AppColors.C_9E9E9E)
                        ),
                        hintText: '+998 __ ___ __ __',
                        hintStyle:TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_9E9E9E,
                        )
                    ),
                  )

                ],
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
