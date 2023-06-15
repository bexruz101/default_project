import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 56,
      width: 500,
      decoration: BoxDecoration(color: AppColors.c_52B6DF,borderRadius:BorderRadius.circular(10)),
      child: InkWell(
        child: Center(child: Text(tr("Update_Profile"),style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600,fontSize: 17),)),
        onTap: onTap,
      ),
    );
  }
}
