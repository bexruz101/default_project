import 'package:default_project/local/shared_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {

  List<String> proudctsName = StorageRepository.getList('productsName');
  List<String> proudctsPrice =  StorageRepository.getList('proudctsPrice');
  List<String> proudctsPicture = StorageRepository.getList('proudctsPhoto');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        elevation: 0,
      ),
      body:StorageRepository.getList('products')!=''?SizedBox(
        width: double.infinity,
        child: ListView(
          children: List.generate(StorageRepository.getList('products').length,(index) => Slidable(
    endActionPane:ActionPane(
    motion: DrawerMotion(),
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
    height: 100,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
    child: Row(
    children: [
    SizedBox(width: 20,),
    Image.asset(proudctsPicture[index],fit: BoxFit.contain,height: 120,),
    SizedBox(width:20,),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(proudctsName[index],style: TextStyle(color: Colors.yellowAccent),),
    SizedBox(height: 5,),
    Text(proudctsPrice[index],style: TextStyle(color: Colors.yellowAccent),),
    ],
    ),
    Spacer(),
    Icon(Icons.shopping_cart,color: Colors.white,),
    SizedBox(width: 20,),
    ],
    ),
    ),
    ),
      ),
    )
      ):null
    );
  }
}
