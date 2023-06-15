import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/model.dart';
import '../../utils/colors.dart';
import 'input_text.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.mainText, required this.hintText, required this.type});

  static late  SharedPreferences preferences;
  Future<void> _init() async{
    preferences = await  SharedPreferences.getInstance();
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _birthdata = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();


  final String mainText;
  final String hintText;
  final TextInputType type;

  static late Map<ProfileModel,dynamic> data;
  static late ProfileModel value2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mainText,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
          SizedBox(height: 10,),
          TextField(
            onSubmitted: (value){
              mainText=='Name'?value2.name = value:mainText == 'Email'?value2.email=value:mainText == 'Data of Birth'?value2.dataOfBirth = value:mainText=='Phone Number'?value2.phoneNumber = value:value2.password=value;
            },
            maxLines: mainText==tr('Address')?4:1,
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

  void _saveData()async{
    String userData = jsonEncode(value2);
    print(userData);
    preferences.setString('userData', userData);
  }
  void _getData(){
    Map<String,dynamic> getDatas = jsonDecode(preferences.getString('userData')!);
    ProfileModel mod =  ProfileModel.fromJson(getDatas);
    if(getDatas.isNotEmpty){
       = TextEditingValue(text: value2.name);
    }
  }



}
