import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/domian/entities/movie.dart';


abstract class BaseMovieRepository {
  Future<Either< Failure,List<Movie>>> getPoupulareMovies();

} 
