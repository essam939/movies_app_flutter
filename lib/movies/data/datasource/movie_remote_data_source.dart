import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:movieapp/core/network/api_constance.dart';

part 'movie_remote_data_source.g.dart'; 

@RestApi(baseUrl: ApiConstance.baseUrl)
abstract class MovieRemoteDataSource {
  factory MovieRemoteDataSource(Dio dio, {String baseUrl}) =
      _MovieRemoteDataSource;

  @GET(ApiConstance.getPopularMoviesPath)
 Future<HttpResponse> getPopularMovies();

  @GET(ApiConstance.searchMoviePath)
  Future<HttpResponse> searchOnMovie(@Query('query') String query);
}
