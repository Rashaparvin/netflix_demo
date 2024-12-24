// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HomeResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

HomeResultData _$HomeResultDataFromJson(Map<String, dynamic> json) =>
    HomeResultData(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
    )..release_date = json['release_date'] as String?;

Map<String, dynamic> _$HomeResultDataToJson(HomeResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'release_date': instance.release_date,
    };
