import 'package:json_annotation/json_annotation.dart';
import '../../data/vos/user_data_vo.dart';

part 'user_account_response.g.dart';

@JsonSerializable()
class UserAccountResponse
{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  UserDataVO? userData;

  @JsonKey(name: "token")
  String? token;

  UserAccountResponse(this.code, this.message, this.userData, this.token);

  factory UserAccountResponse.fromJson(Map<String,dynamic> json) => _$UserAccountResponseFromJson(json);
  Map<String,dynamic> toJson() => _$UserAccountResponseToJson(this);
}