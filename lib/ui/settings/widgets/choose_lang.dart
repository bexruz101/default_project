import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectLang extends StatelessWidget {
  const SelectLang({super.key, required this.icon, required this.icon2, required this.onTap, required this.text});

  final String icon;
  final String icon2;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        SizedBox(width: 12,),
        Container(
            width: 263,
            child: Text(text)
        ),
        SizedBox(width: 22,),
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(icon2),
        )

      ],
    );
  }
}
