import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/Screens/favorite.dart';
import 'package:wallpaper_app/views/Screens/home_screen.dart';
import 'package:wallpaper_app/views/Screens/profile.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    HomeScreen(),
    Favorite(),
    Profile(),
  ];
  List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items: icons,onTap: (value){
        setState(() {
          selectedIndex = value;
        });
      },),
    );
  }
}
