import 'package:default_project/ui/auth/widgets/login/login_input.dart';
import 'package:default_project/ui/auth/widgets/loginwith/login_with.dart';
import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/ui/utils/colors.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:raised_buttons/raised_buttons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

  

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.c_151418,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
                children: [
                  SizedBox(height: height*(103/812)),
                  Text('BURGER BAR',style: TextStyle(color: AppColors.white,fontFamily: 'AR CENA',fontWeight: FontWeight.w500,fontSize: height*(52/812))),
                  SizedBox(height: height*(28/812),),
                  Text('Войдите в свой профиль',style: TextStyle(fontSize: height*(22/812),fontWeight:FontWeight.w700,fontFamily: 'Poppins',color: AppColors.white),),
                  Text('Войдите, чтобы продолжить',style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.c_6C7072),),
                  SizedBox(height: height*(48/812),),
                  InputWidget(text: 'Email', icon1: AppImages.fly, type: TextInputType.emailAddress),
                  SizedBox(height: height*(21/812),),
                  InputWidget(text: 'Password', icon1: AppImages.security, type: TextInputType.text,isPassword: true,icon2:AppImages.eye,),
                  SizedBox(height: height*(33/812),),
                  Text('Или продолжите с помощью  ',style: TextStyle(fontSize: height*(14/812),fontWeight:FontWeight.w500,fontFamily: 'Inter',color: AppColors.white),),
                  SizedBox(height: height*(45/812),),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    margin: EdgeInsets.symmetric(horizontal: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: LoginWith(icon: AppImages.facebook, text: 'Facebook'),
                            flex: 1,
                        ),
                        SizedBox(width: height*(19/812),),
                        Expanded(
                          child: LoginWith(icon: AppImages.google, text: 'Google'),
                          flex: 1,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*(44/812),),
                  GradientText('Забыли пароль?',
                      colors: [AppColors.c_E1D24A,AppColors.c_C69223],
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,fontFamily: 'Inter',),
                    gradientType: GradientType.linear,
                  ),
                  SizedBox(height: 32,),
                  Container(
                    width: 327,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient:LinearGradient(colors:[AppColors.c_C69223,AppColors.c_E1D24A]),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context){
                            return HomeScreen();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                      ),
                      child: Text('Войти',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,fontFamily: 'Poppins',color: AppColors.black),),
                    ),
                  ),


                ]
            ),
          ),
        ),
      ),
    );
  }
}

