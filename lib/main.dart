import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/view_model/wallpaper_view_model.dart';
import 'package:wallpaper_app/views/Screens/Nav_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_)=>WallpaperViewModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const NavScreen(),
    );
  }
}

