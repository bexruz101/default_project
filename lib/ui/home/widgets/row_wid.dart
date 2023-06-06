import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class RowWid extends StatelessWidget {
   RowWid({super.key,required this.txt1,required this.txt2});

  String txt1;
  String txt2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt1,style: TextStyle(fontSize: 14,fontFamily: 'Inter',fontWeight: FontWeight.w400,color: AppColors.white),),
        Text(txt2,style: TextStyle(fontSize: 14,fontFamily: 'Inter',fontWeight: FontWeight.w400,color: AppColors.white),),
      ],
    );
  }
}
