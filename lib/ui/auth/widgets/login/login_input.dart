import 'package:default_project/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputWidget extends StatelessWidget {
   InputWidget({super.key,required this.text,required this.icon1,required this.type,this.icon2 = '',this.isPassword = false});

  String text;
  String icon1;
  String icon2;
  bool isPassword;
  TextInputType type;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*(56/812),
      width:  height*(325/812),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.c_22222A,),
      margin:EdgeInsets.symmetric(horizontal: height*(25/812)),
      child: TextField(
        obscureText: isPassword,
        textInputAction: TextInputAction.done,
        cursorColor: AppColors.white,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(17),
            child: SvgPicture.asset(icon1),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(17),
            child: SvgPicture.asset(icon2),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Poppins',
            color: AppColors.white
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.c_22222A),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.c_22222A),
          ),
        ),
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Poppins',
            color: AppColors.white
        ),
      ),
    );
  }
}
