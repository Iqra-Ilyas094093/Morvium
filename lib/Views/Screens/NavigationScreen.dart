import 'package:flutter/material.dart';
import 'package:wallpaper_app/Views/Screens/homeScreen.dart';
import 'package:wallpaper_app/utils/consts.dart';

class Navigationscreen extends StatefulWidget {
  const Navigationscreen({super.key});

  @override
  State<Navigationscreen> createState() => _NavigationscreenState();
}

class _NavigationscreenState extends State<Navigationscreen> {
  List<Widget> screens = [
    Homescreen(),
    Center(child: Text('search'),),
    Center(child: Text('Add'),),
    Center(child: Text('notifications'),),
    Center(child: Text('profile'),),
  ];
  int selectedIndex =0;
 final List<IconData> icons = [
   Icons.home,
   Icons.home,
   Icons.home,
   Icons.home,
   Icons.home,
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: AppColors.greyColor,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
        BottomNavigationBarItem(icon: selectedIndex == 0?Icon(Icons.home):Icon(Icons.home_outlined),label: 'home'),
        BottomNavigationBarItem(icon: selectedIndex == 1?Icon(Icons.search):Icon(Icons.search_outlined),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: 'home'),
        BottomNavigationBarItem(icon: selectedIndex == 3?Icon(Icons.notifications):Icon(Icons.notifications_none),label: 'home'),
        BottomNavigationBarItem(icon: selectedIndex == 4?Icon(Icons.person):Icon(Icons.person_outline),label: 'home'),
      ])
    );

  }
}
