// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_and_showtime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaAndShowtimeResponse _$GetCinemaAndShowtimeResponseFromJson(
        Map<String, dynamic> json) =>
    GetCinemaAndShowtimeResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaAndShowtimeResponseToJson(
        GetCinemaAndShowtimeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.cinema,
    };
