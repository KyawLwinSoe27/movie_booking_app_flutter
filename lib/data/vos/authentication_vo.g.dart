// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationVO _$AuthenticationVOFromJson(Map<String, dynamic> json) =>
    AuthenticationVO(
      json['phone'] as int?,
      json['otp'] as int?,
    );

Map<String, dynamic> _$AuthenticationVOToJson(AuthenticationVO instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otp': instance.otp,
    };
