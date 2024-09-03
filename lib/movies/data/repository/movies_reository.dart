// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/movies/data/model/movie.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';


class MoviesReository extends BaseMovieRepository {
  final MovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesReository(this.baseMovieRemoteDataSource);

  @override
 

  @override
 Future<Either<Failure, List<Movie>>> getPoupulareMovies() async {
    try {
      final response = await baseMovieRemoteDataSource.getPopularMovies();
      final result = response.data['results'] as List<dynamic>;
      final movies = result.map((e) => Movie.fromJson(e)).toList();
      return Right(movies);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (error) {
      return const Left( ServerFailure('Unexpected error occurred'));
    }
  }

  @override
 Future<Either<Failure, List<Movie>>> searchOnMovie(
      SearchOnMovieParameters parameters) async {
    try {
      final response =
          await baseMovieRemoteDataSource.searchOnMovie(parameters.movieName);
      final result = response.data['results'] as List<dynamic>;
      final movies = result.map((e) => Movie.fromJson(e)).toList();
      return Right(movies);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (error) {
      return const Left(ServerFailure('Unexpected error occurred'));
    }
  }


}
