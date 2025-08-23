import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/Views/logics/longBackspacePressed.dart';
import 'package:wallpaper_app/utils/consts.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late Ticker ticker;
  bool isBackspacePressed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ticker = Ticker((_){
      if(isBackspacePressed){
        LongBackSpacePressed().deleteWord(searchController);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          children: [
            KeyboardListener(
              focusNode: focusNode,
              onKeyEvent: (event){
                LongBackSpacePressed().handleBackspaceKey(event,searchController,ticker,isBackspacePressed);
              },
              child: TextField(
                style: TextStyle(color: AppColors.whiteColor,fontSize: 18,),
                cursorColor: AppColors.whiteColor,
                controller: searchController,
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Search for ideas',
                  // contentPadding: EdgeInsets.only(left: 35),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.camera_alt_outlined,color: AppColors.whiteColor,),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 10),
                    child: Icon(Icons.search,color: AppColors.whiteColor,),
                  ),
                  hintStyle: GoogleFonts.poppins(fontSize: 18,color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.greyColor,width: 2)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppColors.greyColor,width: 2)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white,width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white,width: 3)
                  ),
                ),
              ),
            ),
          ],
        ),
      ))
    );
  }
}
