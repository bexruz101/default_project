import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Point extends StatelessWidget {
  const Point({super.key, required this.height1, required this.width1, });

  final double height1;
  final double width1;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height1,
      width: width1,
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(50),color: AppColors.white),
    );
  }
}
