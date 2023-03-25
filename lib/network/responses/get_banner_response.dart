import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/banner_vo.dart';

part 'get_banner_response.g.dart';

@JsonSerializable()
class GetBannerResponse
{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<BannerVO>? banner;

  GetBannerResponse(this.code, this.message, this.banner);

  factory GetBannerResponse.fromJson(Map<String,dynamic> json) => _$GetBannerResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetBannerResponseToJson(this);
}