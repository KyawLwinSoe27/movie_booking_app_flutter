import 'package:json_annotation/json_annotation.dart';

part 'timeslots_vo.g.dart';

@JsonSerializable()
class TimeslotsVO
{
  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String? startTime;

  @JsonKey(name: "status")
  int? status;

  TimeslotsVO(this.cinemaDayTimeslotId, this.startTime, this.status);
  factory TimeslotsVO.fromJson(Map<String,dynamic> json) => _$TimeslotsVOFromJson(json);
  Map<String,dynamic> toJson() => _$TimeslotsVOToJson(this);

}