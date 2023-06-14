import 'package:default_project/ui/about/about_screen_next.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../settings/widgets/button.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(tr('About_Us?'),),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36,),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AboutScreenNext();
              }));
            },
            child: Text(tr('About_Us?'),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),),
            SizedBox(height: 36,),
            Text(tr('Help'),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),
            SizedBox(height: 36,),
            Text(tr('Term_and_Condition'),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),
            SizedBox(height: 36,),
            Text(tr('Data_Protection'),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),

          ],
        ),
      ),
    );
  }
}
