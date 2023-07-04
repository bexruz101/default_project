import 'package:default_project/data/db/local_database.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/contact_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.name, required this.surname, required this.phone, required this.id, required this.aaa});

  final String name;
  final int id;
  final String surname;
  final String phone;
  final ContactModelSql aaa;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('Contacts'),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 20,),
          Icon(Icons.more_vert),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 200,),
              Icon(Icons.account_circle, size: 100,),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.name),
                  SizedBox(width: 5,),
                  Text(widget.surname),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(widget.phone),
                  Spacer(),
                  SvgPicture.asset(AppImages.phone),
                  SizedBox(width: 4,),
                  SvgPicture.asset(AppImages.message),
                  SizedBox(width: 5,),
                ],),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {
                    widget.id > 0
                        ? LocalDatabase.deleteContact(widget.id)
                        : null;
                    Navigator.pop(context);
                  }, icon: Icon(Icons.delete)),
                  IconButton(onPressed: () {
                    _updateContacts();
                    _updateSingleContact(widget.aaa);
                  }, icon: Icon(Icons.edit)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _updateSingleContact(ContactModelSql contactModelSql) {
    final TextEditingController nameController =
    TextEditingController(text: contactModelSql.name);
    final TextEditingController surnameController =
    TextEditingController(text: contactModelSql.surname);
    final TextEditingController phoneController =
    TextEditingController(text: contactModelSql.phone);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              padding: const EdgeInsets.all(24),
              height: 350,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: surnameController,
                    decoration: const InputDecoration(hintText: "Surname"),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: "Phone"),
                  ),

                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () async {
                        setState(() {});
                        _updateContacts();
                        await LocalDatabase.updateContact(
                          contactsModelSql: contactModelSql.copyWith(
                            surname: surnameController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                          ),
                        );
                        _updateContacts();
                        Navigator.pop(context);
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          );
        });
  }
}
