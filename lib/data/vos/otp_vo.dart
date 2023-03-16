import 'package:json_annotation/json_annotation.dart';

part 'otp_vo.g.dart';

@JsonSerializable()
class OtpVO
{
  @JsonKey(name: "code")
  int? statusCode;

  @JsonKey(name: "message")
  String? message;

  OtpVO(this.statusCode, this.message);
  factory OtpVO.fromJson(Map<String,dynamic> json) => _$OtpVOFromJson(json);
  Map<String,dynamic> toJson() => _$OtpVOToJson(this);
}