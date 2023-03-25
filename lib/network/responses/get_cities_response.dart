
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/cities_vo.dart';

part 'get_cities_response.g.dart';

@JsonSerializable()
class GetCitiesResponse
{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CitiesVO>? cities;

  GetCitiesResponse(this.code, this.message, this.cities);

  factory GetCitiesResponse.fromJson(Map<String,dynamic> json) => _$GetCitiesResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetCitiesResponseToJson(this);
}