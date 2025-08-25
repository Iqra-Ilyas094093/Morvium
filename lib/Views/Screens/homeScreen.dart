import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Views/widgets/masonaryGridView.dart';
import 'package:wallpaper_app/services/api_services.dart';
import 'package:wallpaper_app/utils/consts.dart';

import '../../model/imageModel/image_model.dart';
import 'no_connection_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ApiServices repo = ApiServices();
  late Future<List<Images>> imageList;
  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();
  final List<String> categories = [
    'Trending',
    'Mountains',
    'Stylish dress',
    'Gaming',
    'Friendships',
  ];
  int pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageList = repo.getImageList(pageNumber);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imageList = repo.getImagesBySearch(
                                categories[index],
                              );
                              selectedIndex = index;
                            });
                          },
                          child: Text(
                            categories[index],
                            style: GoogleFonts.poppins(
                              color: AppColors.whiteColor,
                              fontSize: 23,
                            ),
                          ),
                        ),
                        selectedIndex == index
                            ? Container(
                              color: AppColors.whiteColor,
                              height: 5,
                              width: 60,
                            )
                            : SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Masonarygridview(imageList: imageList),
          ],
        ),
      ),
    );
  }
}
