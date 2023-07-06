import 'package:default_project/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../data/db/local_database.dart';
import '../utils/colors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.listener});

  final VoidCallback listener;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) ### - ## - ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add'),
        actions: [
          IconButton(
              onPressed: () async {
                if (_controllerName.text.isNotEmpty) {
                  if (_controllerSurname.text.isNotEmpty) {
                    if (_controllerPhone.text.length == 18) {
                      String phone = _controllerPhone.text.replaceAll(" ", "");
                      phone = phone.replaceAll("(", "");
                      phone = phone.replaceAll(")", "");
                      phone = phone.replaceAll("-", "");

                      ContactModelSql newContact =
                          await LocalDatabase.insertContact(
                        ContactModelSql(
                            phone: '+998$phone',
                            surname: _controllerSurname.text,
                            name: _controllerName.text),
                      );
                      if (newContact.id != null && newContact.id! > 0) {
                        if (context.mounted) {
                          widget.listener.call();
                          Navigator.pop(context);
                        }
                      } else {}
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Telefon nomer to'liq emas!"),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Familiya kiriting"),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Ism kiriting"),
                  ));
                }
              },
              icon: const Icon(Icons.done)),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: _controllerName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.C_9E9E9E)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.C_9E9E9E)),
                        hintText: 'Enter name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_9E9E9E,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Surname'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: _controllerSurname,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.C_9E9E9E)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.C_9E9E9E)),
                        hintText: 'Enter Surname',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_9E9E9E,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Phone number'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      inputFormatters: [maskFormatter],
                      keyboardType: TextInputType.phone,
                      controller: _controllerPhone,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      decoration:  InputDecoration(
                          prefixIcon: Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: const Text("+998"),
                          ),
                          prefixStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.C_9E9E9E)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.C_9E9E9E)),
                          hintText: '__ ___ __ __',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.C_9E9E9E,
                          )),
                      onChanged: (number) {
                        if (number.length == 18) {
                          phoneFocusNode.unfocus();
                        }
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
