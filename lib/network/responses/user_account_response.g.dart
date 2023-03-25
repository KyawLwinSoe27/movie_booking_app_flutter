// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountResponse _$UserAccountResponseFromJson(Map<String, dynamic> json) =>
    UserAccountResponse(
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : UserDataVO.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$UserAccountResponseToJson(
        UserAccountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.userData,
      'token': instance.token,
    };
