import 'package:default_project/ui/utils/colors.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Items extends StatelessWidget {
   Items({super.key,required this.icon,required this.ftext,required this.stext,required this.ttext,});

  String icon;
  String ftext;
  String ttext;
  String stext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.c_22222A,),
      height: 110,
      width: 360,
      child: Row(
        children: [
          Image.asset(icon),
          Column(
            children: [
              Text(ftext,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Inter',color: AppColors.white),),
              SizedBox(height: 10,),
              Text(stext,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'Inter',color: AppColors.c_6A6A6E),),
              SizedBox(height: 10,),
              Text(ttext,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,fontFamily: 'Inter',color: AppColors.white),),
            ],
          ),
          SizedBox(width: 36,),
          Container(
            height: 34,
            width: 85,
            decoration: BoxDecoration(color: AppColors.c_19191D,borderRadius: BorderRadius.circular(24)),
            child: Row(
              children: [
                  SvgPicture.asset(AppImages.plus),
                  SizedBox(width: 17,),
                  Text('1',style: TextStyle(color: AppColors.white,fontSize: 16),),
                  SizedBox(width: 17,),
                  SvgPicture.asset(AppImages.minus),
              ],
            ),
          )
        ],
      ),
    );
  }
}
