import 'package:default_project/ui/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class KrutoyRow extends StatelessWidget {
  const KrutoyRow({super.key, required this.icon, required this.text});

  final String icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: text=='Profile'?(){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProfilScreen();
        }));
      }:(){},
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
