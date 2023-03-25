// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesVO _$MoviesVOFromJson(Map<String, dynamic> json) => MoviesVO(
      json['id'] as int?,
      json['original_title'] as String?,
      json['release_date'] as String?,
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['poster_path'] as String?,
      json['overview'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['runtime'] as int?,
      (json['casts'] as List<dynamic>?)
          ?.map((e) => CastVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesVOToJson(MoviesVO instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'casts': instance.casts,
    };
