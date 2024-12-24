import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/movie/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";
  static const hotAndNewTv = "$kBaseUrl/discover/tv?api_key=$apiKey";
  static const tenseDramas = "$kBaseUrl/trending/tv/week?api_key=$apiKey";
  static const top10 = "$kBaseUrl/discover/tv?api_key=$apiKey&with_origin_country=IN";
  static const releasedLastYear = "$kBaseUrl/movie/popular?api_key=$apiKey";
  static const southIndFilms = "$kBaseUrl/discover/movie?api_key=$apiKey&with_original_language=kn|ml|ta|te";
}
