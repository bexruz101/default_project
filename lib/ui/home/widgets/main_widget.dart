import 'package:default_project/ui/utils/colors.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainWid extends StatelessWidget {
   MainWid({super.key,required this.icon1,required this.topText,required this.timetext,required this.SecondText,required this.ThirdText,
    required this.FourthText,required this.FifthText,required this.SixthText});

  String icon1;
  String topText;
  String timetext;
  String SecondText;
  String ThirdText;
  String FourthText;
  String FifthText;
  String SixthText;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      height: 123,
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: AppColor.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(icon1),
              Text(topText,style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w700,fontSize: 12),),
            ],
          ),
          SizedBox(height: 6,),
          Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NYC',style: TextStyle(fontSize:12,fontWeight: FontWeight.w500,fontFamily: 'Quicksand',color: AppColor.c_555555),),
                  Text(timetext,style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w700,fontSize: 14,color: AppColor.c_333333),)
                ],
              ),
              SizedBox(width: 32,),
              Column(
                children: [
                  Text(SecondText,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontFamily: 'Quicksand',color: AppColor.c_7F7F7F),),
                  SizedBox(height: 5,),
                  SvgPicture.asset(AppImages.plane),
                  Text(ThirdText,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Quicksand',color: AppColor.c_7F7F7F),),
                ],
              ),
              SizedBox(width: 26,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DXB',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11,color: AppColor.c_555555),),
                  Text(FourthText,style: TextStyle(color: AppColor.c_333333,fontSize: 13,fontWeight: FontWeight.w700),),
                  Text(FifthText,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 9,color: AppColor.c_EB5757),),
                ],
              ),
          ],),
          SizedBox(height: 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppImages.watchout),
                  SizedBox(width: 5,),
                  Text('FLIGHT INFO',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color:AppColor.c_A5A5A5),),
                ],
              ),
              Text(SixthText,style: TextStyle(color: AppColor.c_6760D4,fontWeight: FontWeight.w700,fontSize: 16),),
            ],
          )

        ],
      ),
    );
  }
}
