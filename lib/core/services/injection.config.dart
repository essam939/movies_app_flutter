// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movieapp/core/services/di.dart' as _i84;
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart'
    as _i5;
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart'
    as _i61;
import 'package:movieapp/movies/domian/usecase/get_pupulare_movies.dart'
    as _i752;
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart' as _i254;
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart'
    as _i187;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final servicesModule = _$ServicesModule();
    gh.factory<_i187.MoviesBloc>(() => servicesModule.moviesBloc);
    gh.lazySingleton<_i5.MovieRemoteDataSource>(
        () => servicesModule.movieRemoteDataSource);
    gh.lazySingleton<_i61.BaseMovieRepository>(
        () => servicesModule.moviesRepository);
    gh.lazySingleton<_i752.GetPupulareMoviesUseCase>(
        () => servicesModule.getPupulareMoviesUseCase);
    gh.lazySingleton<_i254.SearchOnMovieUseCase>(
        () => servicesModule.searchOnMovieUseCase);
    return this;
  }
}

class _$ServicesModule extends _i84.ServicesModule {}
