// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      backdropPath: json['backdrop_path'] as String,
      overView: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      voteAvrage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overView,
      'vote_average': instance.voteAvrage,
      'release_date': instance.releaseDate,
    };
