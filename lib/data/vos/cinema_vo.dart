import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';

part 'cinema_vo.g.dart';

@JsonSerializable()
class CinemaVO
{
  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "cinema")
  String? cinema;

  @JsonKey(name: "timeslots")
  List<TimeslotsVO>? timeslots;

  bool? isExpanded;


  CinemaVO(this.cinemaId, this.cinema, this.timeslots, this.isExpanded);

  factory CinemaVO.fromJson(Map<String,dynamic> json) => _$CinemaVOFromJson(json);
  Map<String,dynamic> toJson() => _$CinemaVOToJson(this);
}