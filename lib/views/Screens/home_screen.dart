import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/service/api_service.dart';
import 'package:wallpaper_app/view_model/wallpaper_view_model.dart';
import 'package:wallpaper_app/views/widget/fullScreenWallpaper.dart';

import '../../model/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () =>
          Provider.of<WallpaperViewModel>(
            context,
            listen: false,
          ).fetchWallpaper(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WallpaperViewModel>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.asset(
                'assets/images/morvium.png',
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                      width: 10,
                      strokeAlign: 12,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: provider.wallpaper!.photos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreenWallpaper(imageUrl: provider.wallpaper!.photos[index].src.portrait)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(provider.wallpaper!.photos[index].src.medium,fit: BoxFit.cover,)),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
