import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/domian/entities/movie.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';


abstract class BaseMovieRepository {
  Future<Either< Failure,List<Movie>>> getPoupulareMovies();
  Future<Either< Failure,List<Movie>>> searchOnMovie(SearchOnMovieParameters parameters);
} 
