import 'package:default_project/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginWith extends StatelessWidget {
    LoginWith({super.key,required this.icon,required this.text});

  String icon;
  String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Ink(
      height: height*(56/812),
      width: width*(153/812),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: AppColors.c_22222A,),
      child: InkWell(
        onTap: (){},
        child: Center(
          child: Row(
            children: [
              Image.asset(icon),
              const SizedBox(width: 12,),
              Text(text,style: const TextStyle(fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.white),),
            ],
          ),
        ),

      ),
    );
  }
}
