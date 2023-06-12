import 'package:default_project/ui/home/widgets/input_text.dart';
import 'package:default_project/ui/utils/colors.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});



  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profil',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 52,),
              Container(
                height: 110,
                width: 110,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                        child: Image.asset(AppImages.man2)),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: 35,
                          width: 35,
                          child: SvgPicture.asset(AppImages.photo)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: ListView(
                children: [
                  InputText(mainText: 'Name', hintText: 'name', type: TextInputType.name),
                  SizedBox(height: 16,),
                  InputText(mainText: 'Email', hintText: 'name', type: TextInputType.emailAddress),
                  SizedBox(height: 16,),
                  InputText(mainText: 'Date of birth', hintText: 'name', type: TextInputType.text),
                  SizedBox(height: 16,),
                  InputText(mainText: 'Phone Number', hintText: 'name', type: TextInputType.phone),
                  SizedBox(height: 16,),
                  Text('Student ID',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  SizedBox(height: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(color: AppColors.c_CBD5E1,borderRadius:BorderRadius.circular(10),),
                    child: Text('#87654',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.c_64748B),),
                  ),
                  SizedBox(height: 16,),
                  Text('Gender',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:Container(
                          child: Container(
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.done),
                                SizedBox(width: 10,),
                                Text('Male',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),

                              ],
                            ),
                            height: 48,
                            width: 160,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: AppColors.c_F1F5F9))
                          )
                        ) ),
                        SizedBox(width: 16,),
                        Expanded(
                            flex: 1, child:Container(
                            child: Container(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.ndone),
                                  SizedBox(width: 10,),
                                  Text('Female',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                                ],
                              ),
                              height: 48,
                              width: 160,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: AppColors.c_F1F5F9)),
                            )
                        ) ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24,),
                  InputText(mainText: 'Address', hintText: '', type:TextInputType.streetAddress),
                  SizedBox(height: 24,),
                  Ink(
                    height: 56,
                    width: 327,
                    decoration: BoxDecoration(color: AppColors.c_52B6DF,borderRadius:BorderRadius.circular(10)),
                    child: InkWell(
                      child: Center(child: Text('Update Profil',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600,fontSize: 17),)),
                      onTap: (){},
                    ),
                  ),
                  SizedBox(height: 24,),
                ],

              )),
            ],
          ),
        ),
      ),
    );
  }
}
