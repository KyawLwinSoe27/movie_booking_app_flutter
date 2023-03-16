// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVO _$OtpVOFromJson(Map<String, dynamic> json) => OtpVO(
      json['code'] as int?,
      json['message'] as String?,
    );

Map<String, dynamic> _$OtpVOToJson(OtpVO instance) => <String, dynamic>{
      'code': instance.statusCode,
      'message': instance.message,
    };
