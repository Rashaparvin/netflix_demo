import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/constants.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey()
  List<SearchResultData> results;

  SearchResponse({this.results = const []});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'overview')
  String? overView;

  @JsonKey(name: 'title')
  String? title;

  String get posterImageUrl => '$imageAppendUrl$posterPath';

  SearchResultData(
      {this.id,
      this.originalTitle,
      this.posterPath,
      this.overView,
      this.title});

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
