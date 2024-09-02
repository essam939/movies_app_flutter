// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/movies/domian/entities/movie.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';


class MoviesReository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesReository(this.baseMovieRemoteDataSource);

  @override
 

  @override
  Future<Either<Failure, List<Movie>>> getPoupulareMovies() async {
    final result = await baseMovieRemoteDataSource.getPupulareMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}
