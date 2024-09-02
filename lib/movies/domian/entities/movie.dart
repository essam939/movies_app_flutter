import 'package:equatable/equatable.dart';

//2-
class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderIds;
  final String overView;
  final double voteAvrage;
  final String releaseDate;
  const Movie(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.genderIds,
      required this.overView,
      required this.releaseDate,
      required this.voteAvrage});

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genderIds,
      overView,
      releaseDate,
      voteAvrage,
    ];
  }
}
