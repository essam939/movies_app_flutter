
import 'package:movieapp/movies/domian/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genderIds,
      required super.overView,
      required super.releaseDate,
      required super.voteAvrage});
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"] ??"",
      backdropPath: json["backdrop_path"] ??"",
      genderIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overView: json["overview"] ??"",
      releaseDate: json["release_date"] ??"",
      voteAvrage: json["vote_average"].toDouble()??0.0);
}
