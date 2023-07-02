import 'package:default_project/local/shared_repository.dart';
import 'package:default_project/ui/tap_box/market_screem.dart';
import 'package:flutter/material.dart';

class BacckgroundScreen extends StatefulWidget {
  const BacckgroundScreen({super.key, required this.name, required this.photo, required this.descript, required this.indexx, required this.price});

  final String name;
  final String photo;
  final String descript;
  final int indexx;
  final String price;


  @override
  State<BacckgroundScreen> createState() => _BacckgroundScreenState();
}

class _BacckgroundScreenState extends State<BacckgroundScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:Text(widget.name),
        actions: [
          SizedBox(width: 10,),
          IconButton(icon:Icon(Icons.save),onPressed: (){
            setState(() {});
            StorageRepository.putString('name${widget.indexx}', widget.name);
            StorageRepository.putString('photo${widget.indexx}', widget.photo);
            StorageRepository.putString('descript${widget.indexx}', widget.descript);
            StorageRepository.putString('price${widget.indexx}', widget.price);
            StorageRepository.putInt('marketInd', widget.indexx);
            print(StorageRepository.getString('photo${widget.indexx}'));
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
                  child: Image.asset(widget.photo)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text('Nomi',style: TextStyle(color: Colors.blueAccent),),
                  Text(widget.name),
                  Text('Ba\'tafsil',style: TextStyle(color: Colors.blueAccent),),
                  Text(widget.descript),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
