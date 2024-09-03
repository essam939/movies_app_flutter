import 'package:dio/dio.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/api_constance.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/movies/data/model/movie.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getPupulareMovies();
  Future<List<Movie>> searchOnMovie(SearchOnMovieParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<Movie>> getPupulareMovies() async {
    final response = await Dio().get(ApiConstance.getPopularMoviesPath);
    if (response.statusCode == 200) {
      return List<Movie>.from((response.data["results"] as List)
          .map((e) => Movie.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> searchOnMovie(SearchOnMovieParameters parameters) async {
    final response = await Dio().get(ApiConstance.searchMoviePath,queryParameters: {
      "query":parameters.movieName
    });
    if (response.statusCode == 200) {
      return List<Movie>.from((response.data["results"] as List)
          .map((e) => Movie.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
