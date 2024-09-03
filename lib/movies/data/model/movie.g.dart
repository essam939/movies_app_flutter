// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      backdropPath: json['backdropPath'] as String,
      overView: json['overView'] as String,
      releaseDate: json['releaseDate'] as String,
      voteAvrage: (json['voteAvrage'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdropPath': instance.backdropPath,
      'overView': instance.overView,
      'voteAvrage': instance.voteAvrage,
      'releaseDate': instance.releaseDate,
    };
