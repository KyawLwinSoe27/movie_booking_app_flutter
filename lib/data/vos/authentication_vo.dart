import 'package:json_annotation/json_annotation.dart';
part 'authentication_vo.g.dart';

@JsonSerializable()
class AuthenticationVO
{
  @JsonKey(name: "phone")
  int? phone;

  @JsonKey(name: "otp")
  int? otp;

  AuthenticationVO(this.phone, this.otp);

  factory AuthenticationVO.fromJson(Map<String,dynamic> json) => _$AuthenticationVOFromJson(json);
  Map<String,dynamic> toJson() => _$AuthenticationVOToJson(this);
}