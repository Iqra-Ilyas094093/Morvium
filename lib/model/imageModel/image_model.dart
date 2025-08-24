import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/model/imageModel/srcModle.dart';

class Images {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographer_url;
  final String photographer_id;
  final String avg_color;
  final Src src;
  final bool liked;
  final String alt;

  Images({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographer_url,
    required this.photographer_id,
    required this.avg_color,
    required this.src,
    required this.liked,
    required this.alt,
  });
  Images.empty()
  :id =0,
  width = 0,
  height=0,
  url = '',
  photographer = '',
  photographer_id = '',
  photographer_url = '',
  avg_color = '',
  src = Src.empty(),
  liked = false,
  alt = ''
  ;

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographer_url: json['photographer_url'],
      photographer_id: json['photographer_id'],
      avg_color: json['avg_color'],
      src: Src.fromJson(json['src']??{}),
      liked: json['liked'],
      alt: json['alt'],
    );
  }
}
