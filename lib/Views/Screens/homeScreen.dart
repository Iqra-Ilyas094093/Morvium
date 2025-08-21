import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/utils/consts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();
  final List<String> categories = [
    'Trending',
    'Mountains',
    'Stylish dress',
    'Gaming',
    'Friendships',
  ];

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
            Expanded(
              flex: 1,
              child: MasonryGridView.builder(
                itemCount: 40,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                controller: scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                      height: 300,
                      child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/056/860/972/small/young-woman-smiling-in-a-city-at-night-photo.jpg',fit: BoxFit.cover,),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
