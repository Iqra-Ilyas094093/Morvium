import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/service/api_service.dart';

import '../model/models.dart';

class WallpaperViewModel extends ChangeNotifier{
  bool _isLoading = false;
  bool  get isLoading=>_isLoading;
  Model? _wallpaper;
  Model? get wallpaper => _wallpaper;
  Future<void> fetchWallpaper()async{
    _isLoading = true;
    notifyListeners();
    try{
      _wallpaper = await ApiService().pexelService();
    }on Exception catch(e){
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }

}