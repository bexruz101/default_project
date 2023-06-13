import 'package:flutter/material.dart';

import '../../about/about_screen_next.dart';
import '../app_language/app_language_screen.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.a});

  final String text;
  final int a;
  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: (){
      if(a==1){
        Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return a==1?AppLanguage():AboutScreenNext();
            }));
      }

    }, child: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),));
  }
}

