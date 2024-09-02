import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecase/base_use_case.dart';
import 'package:movieapp/movies/domian/entities/movie.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';


class GetPupulareMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetPupulareMoviesUseCase(this.baseMovieRepository);
  @override
   Future<Either< Failure,List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPoupulareMovies();
  }
}
