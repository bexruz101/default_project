import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.mainText, required this.hintText, required this.type});

  final String mainText;
  final String hintText;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mainText,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
          SizedBox(height: 10,),
          TextField(
            maxLines: mainText=='Address'?4:1,
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
           keyboardType: type,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.c_CBD5E1)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color:AppColors.c_CBD5E1 )),
              fillColor: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
