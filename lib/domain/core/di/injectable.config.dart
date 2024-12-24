// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/application/downloads/downloads_bloc.dart' as _i11;
import 'package:netflix/application/fastlaugh/fast_laugh_bloc.dart' as _i12;
import 'package:netflix/application/home_page/home_bloc.dart' as _i13;
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart' as _i14;
import 'package:netflix/application/search/search_bloc.dart' as _i15;
import 'package:netflix/domain/downloads/i_downloads_repo.dart' as _i7;
import 'package:netflix/domain/home/home_service.dart' as _i3;
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart'
    as _i5;
import 'package:netflix/domain/search/search_service.dart' as _i9;
import 'package:netflix/infrastructure/downloads/downloads_repository.dart'
    as _i8;
import 'package:netflix/infrastructure/home/home_impl.dart' as _i4;
import 'package:netflix/infrastructure/hot_and_new/hot_and_new_impl.dart'
    as _i6;
import 'package:netflix/infrastructure/search/search_impl.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.HomeService>(() => _i4.HomeImplementation());
    gh.lazySingleton<_i5.HotAndNewService>(() => _i6.HotAndNewImplementation());
    gh.lazySingleton<_i7.IDownloadsRepo>(() => _i8.DownloadsRepository());
    gh.lazySingleton<_i9.SearchService>(() => _i10.SearchImpl());
    gh.factory<_i11.DownloadsBloc>(
        () => _i11.DownloadsBloc(gh<_i7.IDownloadsRepo>()));
    gh.factory<_i12.FastLaughBloc>(
        () => _i12.FastLaughBloc(gh<_i7.IDownloadsRepo>()));
    gh.factory<_i13.HomeBloc>(() => _i13.HomeBloc(gh<_i3.HomeService>()));
    gh.factory<_i14.HotAndNewBloc>(
        () => _i14.HotAndNewBloc(gh<_i5.HotAndNewService>()));
    gh.factory<_i15.SearchBloc>(() => _i15.SearchBloc(
          gh<_i7.IDownloadsRepo>(),
          gh<_i9.SearchService>(),
        ));
    return this;
  }
}
