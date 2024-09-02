
import 'package:movieapp/movies/data/model/genres_model.dart';
import 'package:movieapp/movies/domian/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage});
        factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      genres: List<GenresModel>.from(json["genres"].map((e) =>GenresModel.fromJson(e))),
      overView: json["overview"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
      runTime: json["runtime"]);

}
