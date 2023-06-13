import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
   NewPage({super.key,required this.image,required this.model,required this.el,required this.year});
  
  String image;
  String model;
  bool el;
  String year;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Super Cars',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Container(
          height: 420,
          width: 380,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12,),
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image),
                SizedBox(height: 40,),
                Text('Car Model:$model',style: TextStyle(color: Colors.red),),
                Text('Is electric car:$el',style: TextStyle(color: Colors.red),),
                Text('Car year:$year',style: TextStyle(color: Colors.red),),
              ],
            )
        ),
      ),
    );
  }
}
