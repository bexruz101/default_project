import 'package:default_project/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuperEasy extends StatelessWidget {
  const SuperEasy({super.key, required this.text, required this.icon});

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text(text,style: TextStyle(color: AppColors.c_64748B,fontSize: 13,fontWeight: FontWeight.w400),),
        SizedBox(width: 14,),
        SvgPicture.asset(icon),
      ],
    );
  }
}
