import 'models.dart';

class Photos {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Src src;
  bool liked;
  String alt;

  Photos(
      {required this.id,
        required this.width,
        required this.height,
        required this.url,
        required this.photographer,
        required this.photographerUrl,
        required this.photographerId,
        required this.avgColor,
        required this.src,
        required this.liked,
        required this.alt});

  factory Photos.fromJson(Map<String, dynamic> json) {
   return Photos(
       id : json['id'],
       width  :json['width'],
       height : json['height'],
   url  : json['url'],
   photographer  : json['photographer'],
   photographerUrl  : json['photographer_url'],
   photographerId  : json['photographer_id'],
   avgColor : json['avg_color'],
   src  : Src.fromJson(json['src']),
    liked : json['liked'],
    alt  :json['alt'],
   );
  }

}