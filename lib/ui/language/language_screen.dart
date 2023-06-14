import 'package:default_project/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  String selectedLang = 'eng_Eng';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Choose language'),),
      body: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(AppImages.eng),
          )
        ],
      ),
    );
  }
}
