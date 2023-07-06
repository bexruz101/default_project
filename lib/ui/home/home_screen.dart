import 'package:default_project/ui/account/acoount_screen.dart';
import 'package:default_project/ui/add_contact/add_contact_screen.dart';
import 'package:default_project/ui/home/widgets/search_view.dart';
import 'package:default_project/ui/update_contact/app_route.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/db/local_database.dart';
import '../../model/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModelSql> contacts = [];
  List<ContactModelSql> allContacts = [];

  String searchText = '';

  int selectedMenu = 1;

  _getContactsByAlp(String order) async {
    contacts = await LocalDatabase.getContactsByAlphabet(order);
    setState(() {});
  }

  _getContactsByQuery(String query) async {
    contacts = await LocalDatabase.getContactsByQuery(query);
    setState(() {});
  }

  _updateContacts() async {
    contacts = await LocalDatabase.getAllContacts();
    allContacts = await LocalDatabase.getAllContacts();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.addContact, arguments: () {
              _updateContacts();
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text('Contacts'),
          actions: [
            IconButton(
              onPressed: () async {
                searchText = await showSearch(
                    context: context,
                    delegate: ContactSearchView(
                      suggestionList: allContacts.map((e) => e.name).toList(),
                    ));
                if (searchText.isNotEmpty) {
                  _getContactsByQuery(searchText);
                } else {
                  _updateContacts();
                }
              },
              icon: Icon(Icons.search),
            ),
            SizedBox(
              width: 20,
            ),
            PopupMenuButton<int>(
                icon: const Icon(Icons.more_vert),
                onSelected: (int item) {
                  setState(() {
                    selectedMenu = item;
                  });
                  if(selectedMenu == 1){
                    contacts.removeRange(0, contacts.length);
                    LocalDatabase.deleteAllContact(null);
                    _updateContacts();
                  }else{
                    _getContactsByAlp(selectedMenu == 2 ? "ASC" : selectedMenu == 3 ? "DESC" : '');
                  }
                },
                position: PopupMenuPosition.values.last,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<int>>[
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('Delete all'),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text('Sort by A-Z'),
                    ),
                    const PopupMenuItem<int>(
                      value: 3,
                      child: Text('Sort by Z-A'),
                    ),
                  ];
                })
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: contacts.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    SvgPicture.asset(AppImages.box),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'You have no contacts yet',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4), fontSize: 17),
                    ),
                  ],
                )
              : ListView(
                  children: List.generate(
                      contacts.length,
                      (index) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.contactDetails,
                                  arguments: {
                                    "aaa": contacts[index],
                                    "deleteListener": (){
                                      _updateContacts();
                                    }
                                  });
                            },
                            leading: const Icon(
                              Icons.account_circle,
                              size: 60,
                            ),
                            title: Row(children: [Text(contacts[index].name),SizedBox(width: 4,),Text(contacts[index].surname),],),
                            subtitle: Text(
                                "${contacts[index].phone}"),
                            trailing: IconButton(onPressed: ()async{
                              await FlutterPhoneDirectCaller.callNumber(contacts[index].phone);
                            },icon: Icon(Icons.phone,color: Colors.green,size: 35,),),
                          ))),
                ),
        ));
  }
}

// selectedMenu != 1 ? _getContactsByAlp(selectedMenu == 2 ? "ASC" : selectedMenu == 3 ? "DESC" : '') : _updateContacts();