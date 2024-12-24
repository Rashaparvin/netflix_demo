import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/home/model/home_response/home_response.dart';

abstract class HomeService {
  Future<Either<MainFailure, HomeResponse>> trendingMovies();
  Future<Either<MainFailure, HomeResponse>> tenseDramas();
  Future<Either<MainFailure, HomeResponse>> top10Movies();
  Future<Either<MainFailure, HomeResponse>> releasedPastYear();
  Future<Either<MainFailure, HomeResponse>> southIndian();
}
