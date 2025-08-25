import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/utils/consts.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('pins',style: GoogleFonts.poppins(fontSize: 18,color: AppColors.whiteColor,),),
                    Text('Boards',style: GoogleFonts.poppins(fontSize: 18,color: AppColors.whiteColor,),),
                    Text('Collage',style: GoogleFonts.poppins(fontSize: 18,color: AppColors.whiteColor,),),

                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.share,color: AppColors.whiteColor,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
