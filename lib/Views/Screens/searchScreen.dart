import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Views/logics/longBackspacePressed.dart';
import 'package:wallpaper_app/Views/widgets/masonaryGridView.dart';
import 'package:wallpaper_app/model/category_model.dart';
import 'package:wallpaper_app/services/api_services.dart';
import 'package:wallpaper_app/utils/consts.dart';

import '../../model/imageModel/image_model.dart';
import '../../utils/imageUrls.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late Ticker ticker;
  late Future<List<Images>> imageList;
  bool isSearch = false;
  bool isBackspacePressed = false;
  List<CategoryModel> categories = [
    CategoryModel(imageUrl: ImageUrls.animals, name: 'Animals'),
    CategoryModel(imageUrl: ImageUrls.art, name: 'Art'),
    CategoryModel(imageUrl: ImageUrls.beauty, name: 'Beauty'),
    CategoryModel(imageUrl: ImageUrls.design, name: 'Design'),
    CategoryModel(imageUrl: ImageUrls.diyCraft, name: 'Diy and Craft'),
    CategoryModel(imageUrl: ImageUrls.food, name: 'Food and drink'),
    CategoryModel(imageUrl: ImageUrls.homeDecor, name: 'Home Decor'),
    CategoryModel(imageUrl: ImageUrls.manFashion, name: 'Man Fashion'),
    CategoryModel(imageUrl: ImageUrls.quotes, name: 'Quotes'),
    CategoryModel(imageUrl: ImageUrls.tattoos, name: 'Tattoos'),
    CategoryModel(imageUrl: ImageUrls.travel, name: 'Travel'),
    CategoryModel(imageUrl: ImageUrls.weddings, name: 'Weddings'),
    CategoryModel(imageUrl: ImageUrls.games, name: 'Games'),
  ];
int pageNumber = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageList = ApiServices().getImageList(pageNumber);
    ticker = Ticker((_) {
      if (isBackspacePressed) {
        LongBackSpacePressed().deleteWord(searchController);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KeyboardListener(
                focusNode: focusNode,
                onKeyEvent: (event) {
                  LongBackSpacePressed().handleBackspaceKey(
                    event,
                    searchController,
                    ticker,
                    isBackspacePressed,
                  );
                },
                child: TextField(
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                  cursorColor: AppColors.whiteColor,
                  controller: searchController,
                  onSubmitted: (value){
                    imageList = ApiServices().getImagesBySearch(value);
                    setState(() {
                      isSearch = true;
                    });
                  },
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Search for ideas',
                    // contentPadding: EdgeInsets.only(left: 35),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10),
                      child: Icon(Icons.search, color: AppColors.whiteColor),
                    ),
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey.shade500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.greyColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.greyColor,
                        width: 2,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              isSearch?Masonarygridview(imageList: imageList):SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Explore something new',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children:categories.map((item){
                        return Container(
                          height: 140,
                          width: 110,
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8, bottom: 8),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(15),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8, top: 8),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: AppColors.blackColor, width: 1),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      item.imageUrl,
                                      fit: BoxFit.cover,)),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 10,
                                child: Text(
                                  item.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
