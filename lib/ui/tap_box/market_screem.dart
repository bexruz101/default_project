import 'package:default_project/local/shared_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        elevation: 0,
      ),
      body:StorageRepository.getString('photo${StorageRepository.getInt('marketInd')}')!=''?SizedBox(
        width: double.infinity,
        child: Slidable(
          endActionPane:ActionPane(
            motion:  DrawerMotion(),
            children: [
              SlidableAction(onPressed: (v){
                setState(() {});
                StorageRepository.deleteString('photo${StorageRepository.getInt('marketInd')}');
                StorageRepository.deleteString('name${StorageRepository.getInt('marketInd')}');
                StorageRepository.deleteString('price${StorageRepository.getInt('marketInd')}');
              },
                backgroundColor: Colors.redAccent,
                icon: Icons.delete,
                label: 'Delete',
              )
            ],
          ) ,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurpleAccent),
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Row(
              children: [
                  SizedBox(width: 20,),
                  Image.asset(StorageRepository.getString('photo${StorageRepository.getInt('marketInd')}'),fit: BoxFit.contain,height: 120,),
                  SizedBox(width:20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StorageRepository.getString('name${StorageRepository.getInt('marketInd')}'),style: TextStyle(color: Colors.yellowAccent),),
                      SizedBox(height: 5,),
                      Text(StorageRepository.getString('price${StorageRepository.getInt('marketInd')}'),style: TextStyle(color: Colors.yellowAccent),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.shopping_cart,color: Colors.white,),
                  SizedBox(width: 20,),
              ],
            ),
          ),
        ),
      ):null,
    );
  }
}
