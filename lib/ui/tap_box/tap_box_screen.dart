import 'package:default_project/ui/tap_box/home_screen.dart';
import 'package:default_project/ui/tap_box/favorite_screen.dart';
import 'package:default_project/ui/tap_box/market_screem.dart';
import 'package:default_project/ui/tap_box/profile_screen.dart';
import 'package:flutter/material.dart';

class TapBox extends StatefulWidget {
  const TapBox({super.key});



  @override
  State<TapBox> createState() => _TapBoxState();
}

class _TapBoxState extends State<TapBox> {

  int currentScreenIndex = 0;

  List<dynamic> screens = [
    HomeScreen(),
    MarketScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        onTap: (index){
          currentScreenIndex = index;
          setState(() {});
        },
        currentIndex: currentScreenIndex,
        selectedItemColor: Colors.yellow,
        selectedIconTheme: IconThemeData(color: Colors.yellow),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label:'' ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.white),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.white),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white),label: ''),
        ],
        
      ),
    );
  }
}
