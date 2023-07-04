import 'package:default_project/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.mainText, required this.hintText, required this.onChanged});

  final String mainText;
  final String hintText;
  final VoidCallback onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mainText),
          const SizedBox(height: 10,),
          TextField(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.C_9E9E9E,
            ),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:AppColors.C_9E9E9E)
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:AppColors.C_9E9E9E)
              ),
              hintText: hintText,
              hintStyle:const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.C_9E9E9E,
              )
            ),
          )

        ],
      ),
    );
  }
}
