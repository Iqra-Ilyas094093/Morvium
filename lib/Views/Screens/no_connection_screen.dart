import 'package:flutter/material.dart';
import 'package:wallpaper_app/utils/consts.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(Icons.cloud_off, color: AppColors.whiteColor)],
      ),
    );
  }
}
