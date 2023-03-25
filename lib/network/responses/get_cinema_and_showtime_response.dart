import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/cinema_vo.dart';

part 'get_cinema_and_showtime_response.g.dart';

@JsonSerializable()
class GetCinemaAndShowtimeResponse
{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaVO>? cinema;

  GetCinemaAndShowtimeResponse(this.code, this.message, this.cinema);
  factory GetCinemaAndShowtimeResponse.fromJson(Map<String,dynamic> json) => _$GetCinemaAndShowtimeResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetCinemaAndShowtimeResponseToJson(this);
}