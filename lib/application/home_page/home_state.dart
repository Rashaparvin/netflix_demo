part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required String stateId,
      required List<HomeResultData> tenseDramaList,
      required List<HomeResultData> trendingList,
      required List<HomeResultData> top10,
      required List<HomeResultData> releasedPastYear,
      required List<HomeResultData> southIndian,
      required bool isLoading,
      required bool isError}) = _Initial;

  factory HomeState.initial() => const HomeState(
        stateId: '0',
        tenseDramaList: [],
        trendingList: [],
        top10: [],
        releasedPastYear: [],
        southIndian: [],
        isLoading: true,
        isError: false,
      );
}
