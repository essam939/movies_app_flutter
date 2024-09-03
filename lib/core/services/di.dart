// services_module.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/movies/data/repository/movies_reository.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domian/usecase/get_pupulare_movies.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart';

Dio dio = Dio();

@module
abstract class ServicesModule {
  @lazySingleton
  MovieRemoteDataSource get movieRemoteDataSource => MovieRemoteDataSource(dio);

  @lazySingleton
  BaseMovieRepository get moviesRepository =>
      MoviesReository(movieRemoteDataSource);

  @lazySingleton
  GetPupulareMoviesUseCase get getPupulareMoviesUseCase =>
      GetPupulareMoviesUseCase(moviesRepository);

  @lazySingleton
  SearchOnMovieUseCase get searchOnMovieUseCase =>
      SearchOnMovieUseCase(moviesRepository);

  @lazySingleton
  MoviesBloc get moviesBloc =>
      MoviesBloc(getPupulareMoviesUseCase, searchOnMovieUseCase);
}
