import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecase/base_use_case.dart';
import 'package:movieapp/movies/domian/entities/movie_details.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';


class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});
  
  @override
  List<Object?> get props => [movieId];
}
