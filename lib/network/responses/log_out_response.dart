
import 'package:json_annotation/json_annotation.dart';

part 'log_out_response.g.dart';

@JsonSerializable()
class LogOutResponse
{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  LogOutResponse(this.code, this.message);

  factory LogOutResponse.fromJson(Map<String,dynamic> json) => _$LogOutResponseFromJson(json);
  Map<String,dynamic> toJson() => _$LogOutResponseToJson(this);
}