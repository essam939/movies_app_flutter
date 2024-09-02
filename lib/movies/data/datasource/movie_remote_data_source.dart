import 'package:dio/dio.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/api_constance.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/movies/data/model/movie_details_model.dart';
import 'package:movieapp/movies/data/model/movies_model.dart';
import 'package:movieapp/movies/domian/usecase/get_movie_details_usecase.dart';


abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getPupulareMovies();
  Future<MovieDetailsModel> getMoviDetails(MovieDetailsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override


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
  Future<MovieDetailsModel> getMoviDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}
