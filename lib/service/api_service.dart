import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:wallpaper_app/utilities/constants.dart';

import '../model/models.dart';

class ApiService{
 Future<Model> pexelService()async{
    final url = Uri.parse(AppUrl.App_url);
    final response = await http.get(url,headers: {
      "Authorization" : AppUrl.API_KEY,
    });
print(response.statusCode);
    if(response.statusCode == 200){
      final  data = jsonDecode(response.body);
     return Model.fromJson(data);
    }else{
      print('error fetching the data from api');
      throw Exception('Failed to load wallpapers');
      print(response);
    }
  }
}