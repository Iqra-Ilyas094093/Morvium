import 'dart:convert';

import 'package:wallpaper_app/model/imageModel/image_model.dart';
import 'package:wallpaper_app/utils/url.dart';
import 'package:http/http.dart' as http;

class ApiServices {


  Future<List<Images>> getImageList(int? pageNumber) async {
    String url;
    List<Images> imageList = [];
    if (pageNumber == null) {
      url = '${AppUrl.BASE_URL}?per_page=80';
    } else {
      url = '${AppUrl.BASE_URL}?per_page=80&page=$pageNumber';
    }
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': AppUrl.API_KEY},
      );
      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body);
        for(final json in jsonData['photos'] as Iterable){
          final image = Images.fromJson(json);
          imageList.add(image);
        }
      }
      else{
        print(response.statusCode);
      }

    } catch (e) {
      print(e);
    }
    return imageList;
  }

  Future<Images> getImageById(int id)async{
    final url = '${AppUrl.BASE_URL}photos/$id';
    Images image = Images.empty();
    try{
      final response = await http.get(Uri.parse(url),headers: {
        'Authorization' : AppUrl.API_KEY,
      });
      if(response.statusCode== 200){
        final jsonData = jsonDecode(response.body);
        image = Images.fromJson(jsonData);
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
    return image;
  }

  Future<List<Images>> getImagesBySearch(String query)async{
    final url = '${AppUrl.BASE_URL}search?query=$query&per_page=80';
    final List<Images> imageList = [];
    try{
      final response = await http.get(Uri.parse(url),headers: {
        'Authorization':AppUrl.API_KEY
      });
      print(response.body);
      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body);
        for(final json in jsonData['photos']as Iterable){
          final image = Images.fromJson(json);
          imageList.add(image);
        }
      }
      else{
        print(response.statusCode);
      }
    }catch(e){print(e.toString());}
    return imageList;
  }

}
