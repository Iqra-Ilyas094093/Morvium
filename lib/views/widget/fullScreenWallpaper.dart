import 'package:flutter/material.dart';

class FullScreenWallpaper extends StatelessWidget {
  String imageUrl;
  FullScreenWallpaper({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(
              color: Colors.blue,
        child: Image.network(imageUrl,fit: BoxFit.cover,height: double.infinity,width: double.infinity,))),
        ],
      ) 
      
      
    );
  }
}
