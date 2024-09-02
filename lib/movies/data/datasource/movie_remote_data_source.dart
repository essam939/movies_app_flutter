import 'package:dio/dio.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/api_constance.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/movies/data/model/movies_model.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getPupulareMovies();
  Future<List<MovieModel>> searchOnMovie(SearchOnMovieParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getPupulareMovies() async {
    final response = await Dio().get(ApiConstance.getPopularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> searchOnMovie(SearchOnMovieParameters parameters) async {
    final response = await Dio().get(ApiConstance.searchMoviePath,queryParameters: {
      "query":parameters.movieName
    });
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
