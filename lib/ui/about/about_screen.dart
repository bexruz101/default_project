import 'package:default_project/ui/about/about_screen_next.dart';
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
        title: Text('About Us'),
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
            child: Text('About Us',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),),
            SizedBox(height: 36,),
            Text('Help',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),
            SizedBox(height: 36,),
            Text('Term and Condition',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),
            SizedBox(height: 36,),
            Text('Data Protection',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black)),

          ],
        ),
      ),
    );
  }
}
