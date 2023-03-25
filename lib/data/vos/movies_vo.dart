
import 'package:json_annotation/json_annotation.dart';
import 'cast_vo.dart';

part 'movies_vo.g.dart';

@JsonSerializable()
class MoviesVO
{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "genres")
  List<String>? genres;

  @JsonKey(name: "poster_path")
  String? posterPath;

  // For Movie Details
  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "rating")
  double? rating;

  @JsonKey(name: "runtime")
  int? runtime;

  @JsonKey(name: "casts")
  List<CastVO>? casts;


  MoviesVO(this.id, this.originalTitle, this.releaseDate, this.genres,
      this.posterPath, this.overview, this.rating, this.runtime, this.casts);

  factory MoviesVO.fromJson(Map<String,dynamic> json) => _$MoviesVOFromJson(json);
  Map<String,dynamic> toJson() => _$MoviesVOToJson(this);
}