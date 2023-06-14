import 'package:easy_localization/easy_localization.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(tr('About_Us?'),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
            SizedBox(height: 24,),
            Text(tr('Lorem'),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 48,),
            Text(tr('Ipsum'),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            SizedBox(height: 18,),
            Text(tr('about_text'),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 18,),
            Text(tr('about_text'),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 18,),
            Text(tr('about_text'),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 18,),
          ],
        ),
      ),
    );
  }
}
