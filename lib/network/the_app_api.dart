import 'package:dio/dio.dart';
import 'package:movie_booking_app/data/vos/authentication_vo.dart';
import 'package:movie_booking_app/data/vos/otp_vo.dart';
import 'package:retrofit/http.dart';

import 'api_constant.dart';

part 'the_app_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheAppApi
{
  factory TheAppApi(Dio dio) = _TheAppApi;

  @POST(GET_OTP)
  Future<OtpVO?> postPhoneNumber(
    @Field() int phoneNumber
  );
}