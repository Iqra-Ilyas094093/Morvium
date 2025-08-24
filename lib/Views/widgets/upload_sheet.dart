import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/utils/consts.dart';

void uploadSheet(BuildContext context){
  showModalBottomSheet(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
    backgroundColor: Colors.grey.shade900,
      context: context, builder: (context){
    return Container(
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 20,),

          //header row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Start creating now',style: GoogleFonts.poppins(color: Colors.blueGrey.shade200,fontSize: 18),textAlign: TextAlign.center,),
            ],
          ),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UploadRowIcons(icon: Icons.pin,caption: 'pin',),
              UploadRowIcons(icon: Icons.dashboard_rounded,caption: 'Collage',),
              UploadRowIcons(icon: Icons.browse_gallery,caption: 'board',),
            ],
          )
          //three upload button row
        ],
      ),
    );
  });
}
class UploadRowIcons extends StatelessWidget {
  String caption;
  IconData icon;
   UploadRowIcons({super.key,required this.icon,required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade800
            ),
            child: Icon(icon,color: Colors.blueGrey.shade200,),
          ),
        ),
        SizedBox(height: 8,),
        Text(caption,style: GoogleFonts.poppins(fontSize: 15,color: Colors.blueGrey.shade200,),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}
