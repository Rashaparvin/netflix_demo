import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  @JsonKey()
  List<HomeResultData> results;

  HomeResponse({this.results = const []});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return _$HomeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class HomeResultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'release_date')
  String? release_date;
  
  HomeResultData({
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
  });

  factory HomeResultData.fromJson(Map<String, dynamic> json) {
    return _$HomeResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeResultDataToJson(this);
}
