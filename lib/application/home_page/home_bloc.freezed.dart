// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() combinedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? combinedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? combinedEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) combinedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? combinedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? combinedEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomeScreenDataCopyWith<$Res> {
  factory _$$GetHomeScreenDataCopyWith(
          _$GetHomeScreenData value, $Res Function(_$GetHomeScreenData) then) =
      __$$GetHomeScreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeScreenData>
    implements _$$GetHomeScreenDataCopyWith<$Res> {
  __$$GetHomeScreenDataCopyWithImpl(
      _$GetHomeScreenData _value, $Res Function(_$GetHomeScreenData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHomeScreenData implements GetHomeScreenData {
  const _$GetHomeScreenData();

  @override
  String toString() {
    return 'HomeEvent.combinedEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() combinedEvent,
  }) {
    return combinedEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? combinedEvent,
  }) {
    return combinedEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? combinedEvent,
    required TResult orElse(),
  }) {
    if (combinedEvent != null) {
      return combinedEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) combinedEvent,
  }) {
    return combinedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? combinedEvent,
  }) {
    return combinedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? combinedEvent,
    required TResult orElse(),
  }) {
    if (combinedEvent != null) {
      return combinedEvent(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenData;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  List<HomeResultData> get tenseDramaList => throw _privateConstructorUsedError;
  List<HomeResultData> get trendingList => throw _privateConstructorUsedError;
  List<HomeResultData> get top10 => throw _privateConstructorUsedError;
  List<HomeResultData> get releasedPastYear =>
      throw _privateConstructorUsedError;
  List<HomeResultData> get southIndian => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      List<HomeResultData> tenseDramaList,
      List<HomeResultData> trendingList,
      List<HomeResultData> top10,
      List<HomeResultData> releasedPastYear,
      List<HomeResultData> southIndian,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? tenseDramaList = null,
    Object? trendingList = null,
    Object? top10 = null,
    Object? releasedPastYear = null,
    Object? southIndian = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      tenseDramaList: null == tenseDramaList
          ? _value.tenseDramaList
          : tenseDramaList // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      trendingList: null == trendingList
          ? _value.trendingList
          : trendingList // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      top10: null == top10
          ? _value.top10
          : top10 // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      releasedPastYear: null == releasedPastYear
          ? _value.releasedPastYear
          : releasedPastYear // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      southIndian: null == southIndian
          ? _value.southIndian
          : southIndian // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      List<HomeResultData> tenseDramaList,
      List<HomeResultData> trendingList,
      List<HomeResultData> top10,
      List<HomeResultData> releasedPastYear,
      List<HomeResultData> southIndian,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? tenseDramaList = null,
    Object? trendingList = null,
    Object? top10 = null,
    Object? releasedPastYear = null,
    Object? southIndian = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_Initial(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      tenseDramaList: null == tenseDramaList
          ? _value._tenseDramaList
          : tenseDramaList // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      trendingList: null == trendingList
          ? _value._trendingList
          : trendingList // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      top10: null == top10
          ? _value._top10
          : top10 // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      releasedPastYear: null == releasedPastYear
          ? _value._releasedPastYear
          : releasedPastYear // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      southIndian: null == southIndian
          ? _value._southIndian
          : southIndian // ignore: cast_nullable_to_non_nullable
              as List<HomeResultData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.stateId,
      required final List<HomeResultData> tenseDramaList,
      required final List<HomeResultData> trendingList,
      required final List<HomeResultData> top10,
      required final List<HomeResultData> releasedPastYear,
      required final List<HomeResultData> southIndian,
      required this.isLoading,
      required this.isError})
      : _tenseDramaList = tenseDramaList,
        _trendingList = trendingList,
        _top10 = top10,
        _releasedPastYear = releasedPastYear,
        _southIndian = southIndian;

  @override
  final String stateId;
  final List<HomeResultData> _tenseDramaList;
  @override
  List<HomeResultData> get tenseDramaList {
    if (_tenseDramaList is EqualUnmodifiableListView) return _tenseDramaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramaList);
  }

  final List<HomeResultData> _trendingList;
  @override
  List<HomeResultData> get trendingList {
    if (_trendingList is EqualUnmodifiableListView) return _trendingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingList);
  }

  final List<HomeResultData> _top10;
  @override
  List<HomeResultData> get top10 {
    if (_top10 is EqualUnmodifiableListView) return _top10;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top10);
  }

  final List<HomeResultData> _releasedPastYear;
  @override
  List<HomeResultData> get releasedPastYear {
    if (_releasedPastYear is EqualUnmodifiableListView)
      return _releasedPastYear;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releasedPastYear);
  }

  final List<HomeResultData> _southIndian;
  @override
  List<HomeResultData> get southIndian {
    if (_southIndian is EqualUnmodifiableListView) return _southIndian;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndian);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, tenseDramaList: $tenseDramaList, trendingList: $trendingList, top10: $top10, releasedPastYear: $releasedPastYear, southIndian: $southIndian, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramaList, _tenseDramaList) &&
            const DeepCollectionEquality()
                .equals(other._trendingList, _trendingList) &&
            const DeepCollectionEquality().equals(other._top10, _top10) &&
            const DeepCollectionEquality()
                .equals(other._releasedPastYear, _releasedPastYear) &&
            const DeepCollectionEquality()
                .equals(other._southIndian, _southIndian) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      const DeepCollectionEquality().hash(_tenseDramaList),
      const DeepCollectionEquality().hash(_trendingList),
      const DeepCollectionEquality().hash(_top10),
      const DeepCollectionEquality().hash(_releasedPastYear),
      const DeepCollectionEquality().hash(_southIndian),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<HomeResultData> tenseDramaList,
      required final List<HomeResultData> trendingList,
      required final List<HomeResultData> top10,
      required final List<HomeResultData> releasedPastYear,
      required final List<HomeResultData> southIndian,
      required final bool isLoading,
      required final bool isError}) = _$_Initial;

  @override
  String get stateId;
  @override
  List<HomeResultData> get tenseDramaList;
  @override
  List<HomeResultData> get trendingList;
  @override
  List<HomeResultData> get top10;
  @override
  List<HomeResultData> get releasedPastYear;
  @override
  List<HomeResultData> get southIndian;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
