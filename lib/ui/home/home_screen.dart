import 'package:default_project/ui/home/widgets/main_widget.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[AppColor.c_6760D4,AppColor.c_F0A1C6,AppColor.c_FDC4B3])),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: height*(19/812),vertical: height*(55/812)),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppImages.right),
                  SizedBox(width: height*(90/812),),
                  Text('SEARCH RESULT',style: TextStyle(color: AppColor.white,fontSize: 17,fontWeight: FontWeight.w700,fontFamily: 'Quicksand'),),
                  SizedBox(width: height*(74/812),),
                  SvgPicture.asset(AppImages.options),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                 //margin: EdgeInsets.symmetric(horizontal: 20),
                 height: 60,
                 width: 350,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.white,),
                 child: Row(
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(left: 15),
                      child: Text('22 AUG\n \$1070', ),
                    ),
                    const SizedBox(width: 20,),
                    const Text('23 AUG\n \$1114', ),
                    const SizedBox(width: 20,),
                    const Text('24 AUG\n \$1114', ),
                    const SizedBox(width: 20,),
                    const Text('25 AUG\n \$1122', ),
                    const SizedBox(width: 13,),
                    Container(
                        padding: EdgeInsets.all(12),
                        height: 60,
                        width: 54,
                        decoration: BoxDecoration(borderRadius:BorderRadius.only(topRight: Radius.circular(6),bottomRight: Radius.circular(6)),color: AppColor.c_FC9A7D,),
                        child: SvgPicture.asset(AppImages.calendar),
                      ),
                  ],
              ),
               ),
              SizedBox(height: 12,),
              Expanded(child: ListView(
                children: [
                  MainWid(icon1: AppImages.turkishair, topText: 'Turkish Airlines',timetext: '09:45',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '19:00',FifthText: '+1 Days',SixthText: '\$1070',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.ethopiaair, topText: 'Ethiopian Airlines',timetext: '11:00',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '20:00',FifthText: '+1 Days',SixthText: '\$1140',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.etihadair, topText: 'Etihad Airways',timetext: '09:45',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '19:00',FifthText: '+1 Days',SixthText: '\$1210',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.ethopiaair, topText: 'Ethiopian Airlines',timetext: '11:20',SecondText: '12hrs 30mins',ThirdText: 'Non stop',FourthText: '07:20',FifthText: '+1 Days',SixthText: '\$1430',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.turkishair, topText: 'Turkish Airlines',timetext: '09:45',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '19:00',FifthText: '+1 Days',SixthText: '\$1070',),
                  MainWid(icon1: AppImages.turkishair, topText: 'Turkish Airlines',timetext: '09:45',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '19:00',FifthText: '+1 Days',SixthText: '\$1070',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.ethopiaair, topText: 'Ethiopian Airlines',timetext: '11:00',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '20:00',FifthText: '+1 Days',SixthText: '\$1140',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.etihadair, topText: 'Etihad Airways',timetext: '09:45',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '19:00',FifthText: '+1 Days',SixthText: '\$1210',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.ethopiaair, topText: 'Ethiopian Airlines',timetext: '11:20',SecondText: '12hrs 30mins',ThirdText: 'Non stop',FourthText: '07:20',FifthText: '+1 Days',SixthText: '\$1430',),
                  SizedBox(height: 11,),
                  MainWid(icon1: AppImages.turkishair, topText: 'Turkish Airlines',timetext: '09:45',SecondText: '17hrs 15mins',ThirdText: '1 stop',FourthText: '19:00',FifthText: '+1 Days',SixthText: '\$1070',),
                ],

              )),

            ],
          ),
        ),

      ),
    );
  }
}
