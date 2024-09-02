import 'package:get_it/get_it.dart';
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/movies/data/repository/movies_reository.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domian/usecase/get_pupulare_movies.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // bloc
    // to refactor bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl()));
    // use cases
    sl.registerLazySingleton(() => GetPupulareMoviesUseCase(sl()));
    sl.registerLazySingleton(() => SearchOnMovieUseCase(sl()));
    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesReository(sl()));
    // data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
