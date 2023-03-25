import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movies_vo.dart';

part 'get_movies_response.g.dart';

@JsonSerializable()
class GetMoviesResponse
{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<MoviesVO>? movies;

  GetMoviesResponse(this.code, this.message, this.movies);

  factory GetMoviesResponse.fromJson(Map<String,dynamic> json) => _$GetMoviesResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetMoviesResponseToJson(this);
}