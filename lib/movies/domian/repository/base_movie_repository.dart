import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/domian/entities/movie.dart';
import 'package:movieapp/movies/domian/entities/movie_details.dart';
import 'package:movieapp/movies/domian/usecase/get_movie_details_usecase.dart';


abstract class BaseMovieRepository {
  Future<Either< Failure,List<Movie>>> getPoupulareMovies();
  Future<Either< Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters );

} 
