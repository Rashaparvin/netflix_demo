import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/model/home_response/home_response.dart';
import 'package:netflix/infrastructure/home/home_impl.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    // get home screen data

    on<GetHomeScreenData>((event, emit) async {
      //send loading to UI
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      // get data
      final _trendingResult = await _homeService.trendingMovies();
      final _dramaResult = await _homeService.tenseDramas();
      final _top10Result = await _homeService.top10Movies();
      final _releasedPastYear = await _homeService.releasedPastYear();
      final _southIndian = await _homeService.southIndian();

      // transform data
      final _state1 = _trendingResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: [],
            trendingList: [],
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: true);
      }, (HomeResponse resp) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: [],
            trendingList: resp.results,
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: false);
      });

      // emit trending movie data to UI
      emit(_state1);

      final _state2 = _dramaResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: [],
            trendingList: [],
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: true);
      }, (HomeResponse resp) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: resp.results,
            trendingList: state.trendingList,
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: false);
      });

      // emit trending movie, tense drama to UI
      emit(_state2);

      final _state3 = _top10Result.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: [],
            trendingList: [],
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: true);
      }, (HomeResponse resp) {
        final list = (resp.results)
            .where((movie) => movie.posterPath != null)
            .toList();
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: state.tenseDramaList,
            trendingList: state.trendingList,
            top10: list,
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: false);
      });

      // emit trending movie, tense drama, top 10 to UI
      emit(_state3);

      final _state4 = _releasedPastYear.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: [],
            trendingList: [],
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: true);
      }, (HomeResponse resp) {
        final list = (resp.results)
            .where((movie) => DateTime.parse(movie.release_date!).year == 2023)
            .toList();
        list.shuffle();
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: state.tenseDramaList,
            trendingList: state.trendingList,
            top10: state.top10,
            releasedPastYear: list,
            southIndian: [],
            isLoading: false,
            isError: false);
      });

      // emit trending movie, tense drama,top 10 and last year released movies to UI
      emit(_state4);

      final _state5 = _southIndian.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: [],
            trendingList: [],
            top10: [],
            releasedPastYear: [],
            southIndian: [],
            isLoading: false,
            isError: true);
      }, (HomeResponse resp) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            tenseDramaList: state.tenseDramaList,
            trendingList: state.trendingList,
            top10: state.top10,
            releasedPastYear: state.releasedPastYear,
            southIndian: resp.results,
            isLoading: false,
            isError: false);
      });

      emit(_state5);
    });
  }
}
