import 'package:default_project/ui/about/about_screen.dart';
import 'package:default_project/ui/profile/profile_screen.dart';
import 'package:default_project/ui/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../account/account_screen.dart';

class KrutoyRow extends StatelessWidget {
  const KrutoyRow({super.key, required this.icon, required this.text, required this.num});

  final String icon;
  final String text;
  final int num;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return num==1?ProfilScreen():num==2?AccountScreen():num==3?SettingsScreen():AboutScreen();
        }));
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: AppColors.c_F1F5F9,borderRadius: BorderRadius.circular(50)),
            child: SvgPicture.asset(icon),
          ),
          SizedBox(width: 14,),
          Text(text,style: TextStyle(color: AppColors.c_0F172A,fontSize: 15,fontWeight: FontWeight.w500),),
          Spacer(),
          SvgPicture.asset(AppImages.left),

        ],
      ),
    );
  }
}
