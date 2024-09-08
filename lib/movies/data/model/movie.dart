import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final int id;
  final String title;
  
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'overview')
  final String overView;

  @JsonKey(name: 'vote_average')
  final double voteAvrage;

  @JsonKey(name: 'release_date')
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
