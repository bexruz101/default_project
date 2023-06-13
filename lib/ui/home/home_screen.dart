import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:default_project/ui/widgets/points.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../widgets/krutoy_row.dart';
import '../widgets/super_easy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(AppImages.logo),SizedBox(width: 10,),Text('Study',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)],
        ),
      ),
      body: Center(
        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 16,),
              Divider(thickness: 0.3,),
              SizedBox(height: 16,),
              Row(
                children: [
                  Image.asset(AppImages.man),
                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome',style: TextStyle(color: AppColors.c_64748B,fontSize: 15,fontWeight: FontWeight.w400),),
                      SizedBox(height: 4,),
                      Text('Marvin McKinney',style: TextStyle(color: AppColors.c_0F172A,fontWeight: FontWeight.w600,fontSize: 17),),
                    ],
                  ),
                  SizedBox(width: 85,),
                  Container(
                    padding: EdgeInsets.all(12),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: AppColors.c_F1F5F9,borderRadius: BorderRadius.circular(50)),
                    child: SvgPicture.asset(AppImages.exit),
                  )
                ],
              ),
              SizedBox(height: 16,),
              Divider(thickness: 0.3,),
              SizedBox(height: 40,),
              KrutoyRow(icon: AppImages.account, text: 'Profile', num: 1,),
              SizedBox(height: 25,),
              KrutoyRow(icon: AppImages.security, text: 'Account', num: 2,),
              SizedBox(height: 25,),
              KrutoyRow(icon: AppImages.settings, text: 'Setting', num: 3,),
              SizedBox(height: 25,),
              KrutoyRow(icon: AppImages.help, text: 'About', num: 4,),
              SizedBox(height: 54,),
              Container(
                height:85,
                width: 365,
                decoration: BoxDecoration(color: AppColors.c_52B6DF,borderRadius: BorderRadius.circular(10)),
                child:  Stack(
                  children: [Positioned(
                      child: Point(height1: 7, width1: 7),
                      top: 20,
                      left: 22,
                  ),
                  Positioned(
                      child: Point(height1: 4, width1: 4),
                    top: 13,
                    left: 92,
                  ),
                  Positioned(
                      child: Point(height1: 3, width1: 3),
                    top: 69,
                    left: 26,
                  ),
                  Positioned(
                      child: Point(height1: 3, width1: 3),
                    top: 73,
                    left: 78,
                  ),
                  Positioned(child: SvgPicture.asset(AppImages.headphones),
                  top: 27,left: 37,
                  ),
                  Positioned(child: SvgPicture.asset(AppImages.halfcircul1),
                    top: 13,left: 39,
                  ),
                  Positioned(child: SvgPicture.asset(AppImages.halfcircul2),
                    top: 14,left: 25,
                  ),
                  Positioned(child: SvgPicture.asset(AppImages.halfcircul2),
                    top: 14,left: 25,
                  ),
                    Positioned(child: Container(
                      padding: EdgeInsets.all(12),
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(color: AppColors.c_F1F5F9.withOpacity(0.08),borderRadius: BorderRadius.circular(50)),
                    ),
                      bottom: 27,right: 10,
                    ),
                    Positioned(child: Container(
                      padding: EdgeInsets.all(12),
                      height: 92,
                      width: 92,
                      decoration: BoxDecoration(color: AppColors.c_F1F5F9.withOpacity(0.08),borderRadius: BorderRadius.circular(50)),
                    ),
                      bottom: 8,left: 275,
                    ),
                    Positioned(child: Container(
                      padding: EdgeInsets.all(12),
                      height: 132,
                      width: 132,
                      decoration: BoxDecoration(color: AppColors.c_F1F5F9.withOpacity(0.08),borderRadius: BorderRadius.circular(70)),
                    ),
                      left: 255,bottom: 0.2,
                    ),
                  Positioned(child: Text('How can we help you?',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w500,fontSize: 17),),
                    top: 31,left: 140,
                  ),


                  ]
                ),

              ),
              SizedBox(height: 63,),
              Row(children: [
                SuperEasy(text: 'Privacy Policy', icon: AppImages.left),
                SizedBox(width: 44,),
                SuperEasy(text: 'Terms', icon: AppImages.left),
                SizedBox(width: 44,),
                SuperEasy(text: 'English', icon: AppImages.bottom),
              ],),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImages.menu),
                    SizedBox(width: 70,),
                    SvgPicture.asset(AppImages.message),
                    SizedBox(width: 70,),
                    SvgPicture.asset(AppImages.chat),
                    SizedBox(width: 70,),
                    SvgPicture.asset(AppImages.account2),
                    SizedBox(height: 90,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
