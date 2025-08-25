import 'package:flutter/material.dart';
import 'package:wallpaper_app/Views/Screens/homeScreen.dart';
import 'package:wallpaper_app/Views/Screens/in_box_screen.dart';
import 'package:wallpaper_app/Views/Screens/profileScreen.dart';
import 'package:wallpaper_app/Views/Screens/searchScreen.dart';
import 'package:wallpaper_app/Views/widgets/upload_sheet.dart';
import 'package:wallpaper_app/utils/consts.dart';

class Navigationscreen extends StatefulWidget {
  const Navigationscreen({super.key});

  @override
  State<Navigationscreen> createState() => _NavigationscreenState();
}

class _NavigationscreenState extends State<Navigationscreen> {
  List<Widget> screens = [
    Homescreen(),
    Searchscreen(),
    InBoxScreen(),
    Profilescreen(),
  ];
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: AppColors.greyColor,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex<2?selectedIndex:selectedIndex +1,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          onTap: (index){
          if(index == 2){
            uploadSheet(context);
          }
          else{
            setState(() {
              selectedIndex = index<2?index:index -1;
            });
          }

          },
          items: [
        BottomNavigationBarItem(icon: selectedIndex == 0?Icon(Icons.home):Icon(Icons.home_outlined),label: 'home'),
        BottomNavigationBarItem(icon: selectedIndex == 1?Icon(Icons.search):Icon(Icons.search_outlined),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: 'home'),
        BottomNavigationBarItem(icon: selectedIndex == 2?Icon(Icons.notifications):Icon(Icons.notifications_none),label: 'home'),
        BottomNavigationBarItem(icon: selectedIndex == 3?Icon(Icons.person):Icon(Icons.person_outline),label: 'home'),
      ])
    );

  }
}
