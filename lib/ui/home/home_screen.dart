import 'package:default_project/ui/account/acoount_screen.dart';
import 'package:default_project/ui/add_contact/add_contact_screen.dart';
import 'package:default_project/ui/home/widgets/search_view.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
     selectedMenu != 1 ? _getContactsByAlp(selectedMenu == 2 ? "ASC" : selectedMenu == 3 ? "DESC":''): _updateContacts();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text('Contacts'),
        actions: [
          IconButton(onPressed: ()async{
            searchText = await showSearch(context: context, delegate: ContactSearchView(suggestionList:allContacts.map((e) => e.name).toList(),
            )
            );
          }, icon: Icon(Icons.search),),
          SizedBox(width: 20,),
          PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              onSelected: (int item){
                setState(() {
                  selectedMenu = item;
                });

              },
              position: PopupMenuPosition.values.last,
              itemBuilder: (BuildContext context){
                return  <PopupMenuEntry<int>>[
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Default'),
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
        child:contacts.isEmpty?Column(
          children: [
            SizedBox(height: 300,),
            SvgPicture.asset(AppImages.box),
            const SizedBox(height: 10,),
            Text('You have no contacts yet',style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 17),),
          ],
        ):ListView(
          children: List.generate(contacts.length, (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child:GestureDetector(
              onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AccountScreen(name: contacts[index].name, surname: contacts[index].surname, phone: contacts[index].phone, id: contacts[index].id ?? 0, aaa: contacts[index],);
                    }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    SizedBox(height: 20,),
                    Icon(Icons.account_circle,size: 50,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(contacts[index].name,style: TextStyle(fontSize: 17),),
                            SizedBox(width: 4,),
                            Text(contacts[index].surname,style: TextStyle(fontSize: 17),),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Text(contacts[index].phone,style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    SizedBox(width: 30,),
                    Spacer(),
                    Icon(Icons.phone,color: Colors.green,size: 35,),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ))
        ),
      ),
    );
  }
}
