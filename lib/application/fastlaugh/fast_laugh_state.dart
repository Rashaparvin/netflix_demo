part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    @Default([]) List<Downloads> videoList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory FastLaughState.initial() =>
      const FastLaughState(videoList: [], isLoading: true, isError: false);
}
