import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overView;
  final double voteAvrage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overView,
    required this.releaseDate,
    required this.voteAvrage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"] ?? "",
        backdropPath: json["backdrop_path"] ?? "",
        overView: json["overview"] ?? "",
        releaseDate: json["release_date"] ?? "",
        voteAvrage: (json["vote_average"]?.toDouble() ?? 0.0),
      );

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        overView,
        voteAvrage,
        releaseDate,
      ];
}
