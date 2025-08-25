import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../model/imageModel/image_model.dart';
import '../../utils/consts.dart';
import '../Screens/no_connection_screen.dart';

class Masonarygridview extends StatelessWidget {
  Future<List<Images>> imageList;

  Masonarygridview({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return NoConnectionScreen();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong. Try again later'));
          }
          return Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                double height = (index % 10 + 1) * 100;
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        placeholder: (context,url)=>Center(child: CircularProgressIndicator()),
                        errorWidget: (context,url,_)=>Icon(Icons.error),
                        imageUrl: snapshot.data![index].src.portrait,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: height > 300 ? 300 : height,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 17.0,
                        top: 2,
                        bottom: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: AppColors.whiteColor,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: snapshot.data!.length,
            ),
          );
        }
      },
    );
  }
}
