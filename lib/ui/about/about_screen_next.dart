import 'package:flutter/material.dart';

class AboutScreenNext extends StatefulWidget {
  const AboutScreenNext({super.key});

  @override
  State<AboutScreenNext> createState() => _AboutScreenNextState();
}

class _AboutScreenNextState extends State<AboutScreenNext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Us?',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
            SizedBox(height: 24,),
            Text('''Study is a  Lorem ipsum dolor sit amet,
consectetur adipiscing elit. Morbi tellus 
ut sagittis libero augue interdum. 
           ''',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 48,),
            Text('Lorem Ipsum',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            SizedBox(height: 18,),
            Text('''Lorem ipsum dolor sit amet, consectetur
adipiscing elit. Morbi tellus ut sagittis 
libero augue interdum.          
            ''',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 18,),
            Text('''Lorem ipsum dolor sit amet, consectetur
adipiscing elit. Morbi tellus ut sagittis 
libero augue interdum.          
            ''',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 18,),
            Text('''Lorem ipsum dolor sit amet, consectetur
adipiscing elit. Morbi tellus ut sagittis 
libero augue interdum.          
            ''',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 18,),
          ],
        ),
      ),
    );
  }
}
