import 'package:default_project/ui/settings/widgets/choose_lang.dart';
import 'package:default_project/utils/colors.dart';
import 'package:default_project/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLanguage extends StatefulWidget {
  const AppLanguage({super.key});

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {

  String _icon1 = AppImages.done;
  String _icon2 = AppImages.ndone;
  String _icon3 = AppImages.ndone;
  String _icon4 = AppImages.ndone;
  String _icon5 = AppImages.ndone;
  String _icon6 = AppImages.ndone;
  String _icon7 = AppImages.ndone;
  String _icon8 = AppImages.ndone;
  String _icon9 = AppImages.ndone;

  int count = 0;

  @override
  void initState() {
    count;
    _icon1;
    _icon2;
    _icon3;
    _icon4;
    _icon5;
    _icon6;
    _icon7;
    _icon8;
    _icon9;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Choose your language'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 12),
                      child: SvgPicture.asset(AppImages.search)
                  ),
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.c_F3F5F8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.c_F3F5F8),
                  )
                ),
              ),
            ),
            SizedBox(height: 32,),
            Expanded(child: ListView(
              children: [
                Container(
                  child: SelectLang(icon: AppImages.indonesia, icon2: _icon1, onTap: (){
                      _icon1 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;
                    setState(() {});
                  }, text: 'Indonesia'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.philippine, icon2: _icon2, onTap: (){
                      _icon2 = AppImages.done;
                      _icon1 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;
                    setState(() {});
                  }, text: 'Philippines'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.italy, icon2: _icon3, onTap: (){
                      _icon3 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;
                    setState(() {});
                  }, text: 'Italy'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.ireland, icon2: _icon4, onTap: (){

                      _icon4 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;
                    setState(() {});
                  }, text: 'Ireland'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.german, icon2: _icon5, onTap: (){

                      _icon5 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;
                    setState(() {});
                  }, text: 'German'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.malaysia, icon2: _icon6, onTap: (){

                      _icon6 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;
                    setState(() {});
                  }, text: 'Malaysia'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.usa, icon2: _icon7, onTap: (){

                      _icon7 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon9 = AppImages.ndone;

                    setState(() {});
                  }, text: 'America'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.belgia, icon2: _icon8, onTap: (){

                      _icon8 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                      _icon9 = AppImages.ndone;

                    setState(() {});
                  }, text: 'Belgia'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
                Container(
                  child: SelectLang(icon: AppImages.newzeland, icon2: _icon9, onTap: (){

                      _icon9 = AppImages.done;
                      _icon2 = AppImages.ndone;
                      _icon3 = AppImages.ndone;
                      _icon4 = AppImages.ndone;
                      _icon5 = AppImages.ndone;
                      _icon6 = AppImages.ndone;
                      _icon7 = AppImages.ndone;
                      _icon8 = AppImages.ndone;
                      _icon1 = AppImages.ndone;
                    setState(() {});
                  }, text: 'New Zeland'),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                ),
                SizedBox(height: 24,),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
