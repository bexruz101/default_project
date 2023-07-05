import 'package:default_project/local/shared_repository.dart';
import 'package:default_project/model/app_model.dart';
import 'package:default_project/ui/tap_box/market_screem.dart';
import 'package:flutter/material.dart';

class BacckgroundScreen extends StatefulWidget {
  const BacckgroundScreen({super.key, required this.indexx, required this.modell});

  final AppModel modell;
  final int indexx;



  @override
  State<BacckgroundScreen> createState() => _BacckgroundScreenState();
}

class _BacckgroundScreenState extends State<BacckgroundScreen> {

  List<String> proudctsName = [];
  List<String> proudctsPrice = [];
  List<String> proudctsPicture = [];
  List<String> proudctsCount = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:Text(widget.modell.name),
        actions: [
          SizedBox(width: 10,),
          IconButton(icon:Icon(Icons.save),onPressed: (){
            setState(() {});
            proudctsName = StorageRepository.getList('productsName');
            proudctsPrice = StorageRepository.getList('productsPrice');
            proudctsPicture = StorageRepository.getList('productsPhoto');
            proudctsCount = StorageRepository.getList('productsPhoto');
            proudctsName.add(widget.modell.name);
            proudctsPrice.add(widget.modell.secondPrice);
            proudctsPicture.add(widget.modell.photo);
            proudctsCount.add(widget.modell.count as String);
            StorageRepository.putList('productsName',proudctsName);
            StorageRepository.putList('productsPrice',proudctsPrice);
            StorageRepository.putList('productsPhoto',proudctsPicture);
            StorageRepository.putList('proudctsCount',proudctsCount);
          },),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 30,),
              SizedBox(
                height: 400,
                  width: 400,
                  child: Image.asset(widget.modell.photo)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text('Nomi',style: TextStyle(color: Colors.blueAccent),),
                  Text(widget.modell.name),
                  Text('Ba\'tafsil',style: TextStyle(color: Colors.blueAccent),),
                  Text(widget.modell.description),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
