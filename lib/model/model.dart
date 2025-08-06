import 'models.dart';

class Model {
  int totalResults;
  int page;
  int perPage;
  List<Photos> photos;
  String nextPage;

  Model({
    required this.totalResults,
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPage,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      totalResults: json['total_results'],
      page: json['page'],
      perPage: json['per_page'],
      photos: json['photos'] != null
          ? (json['photos'] as List)
          .map((photoJson) => Photos.fromJson(photoJson))
          .toList()
          : [],
      nextPage: json['next_page'],
    );
  }
}