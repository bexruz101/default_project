import 'package:default_project/ui/home/widgets/items.dart';
import 'package:default_project/ui/home/widgets/row_wid.dart';
import 'package:default_project/ui/utils/colors.dart';
import 'package:default_project/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.c_151418,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Детали заказа',style: TextStyle(fontFamily: 'Inter',fontSize: 20,fontWeight: FontWeight.w700),),
        elevation: 0,
        backgroundColor: AppColors.c_151418,
        leading: Container(
          margin: EdgeInsets.all(9)  ,
          height: height*(44/812),
          width: width*(44/812),
          decoration:BoxDecoration(
        gradient:LinearGradient(colors:[AppColors.c_C69223,AppColors.c_E1D24A]),
        borderRadius: BorderRadius.circular(10),
      ),
          child: Padding(
            padding:  EdgeInsets.all(7),
            child: SvgPicture.asset(AppImages.right),
          ),
        ),
      ),
      body: ListView(
        children: [Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Items(icon: AppImages.burger, ftext: 'Чикен Бургер', stext: 'Изящный бургер', ttext: '₽160'),
                SizedBox(height: 21,),
                Items(icon: AppImages.fri, ftext: 'Картошка Фри', stext: 'Хрустят отлично', ttext: '₽100'),
                SizedBox(height: 21,),
                Items(icon: AppImages.cocktail, ftext: 'Молочный ', stext: 'Отлично', ttext: '₽120'),
                SizedBox(height: 30,),
                Container(
                  height: 409,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),color: AppColors.c_18171C),
                  child: Padding(
                    padding:  EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        RowWid(txt1: 'Стоимость всех товаров', txt2: '₽380'),
                        SizedBox(height: 14,),
                        RowWid(txt1: 'Чаевые курьеру', txt2: '₽30'),
                        SizedBox(height: 14,),
                        RowWid(txt1: 'Общая стоимость', txt2: '₽410'),
                        SizedBox(height:55,),
                        Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient:LinearGradient(colors:[AppColors.c_C69223,AppColors.c_E1D24A]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                            ),
                            child: Text('Оплатить',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,fontFamily: 'Poppins',color: AppColors.black),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),]
      ),
    );
  }
}
