import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecase/base_use_case.dart';
import 'package:movieapp/movies/data/model/movie.dart';
import 'package:movieapp/movies/domian/repository/base_movie_repository.dart';

class SearchOnMovieUseCase extends BaseUseCase<List<Movie>,SearchOnMovieParameters> {
  final BaseMovieRepository baseMovieRepository;
  SearchOnMovieUseCase(this.baseMovieRepository);
  @override
   Future<Either< Failure,List<Movie>>> call(SearchOnMovieParameters parameters) async {
    return await baseMovieRepository.searchOnMovie(parameters);
  }
}
class SearchOnMovieParameters extends Equatable {
  final String movieName;

  const SearchOnMovieParameters({required this.movieName});
  
  @override
  List<Object?> get props => [movieName];
}
