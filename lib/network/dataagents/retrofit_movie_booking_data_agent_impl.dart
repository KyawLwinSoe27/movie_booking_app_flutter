import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_booking_app/data/vos/authentication_vo.dart';
import 'package:movie_booking_app/data/vos/otp_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_data_agent.dart';
import 'package:movie_booking_app/network/the_app_api.dart';

class RetrofitMovieBookingDataAgentImpl extends MovieBookingDataAgent
{
  late TheAppApi mApi;

  static final RetrofitMovieBookingDataAgentImpl _singleton = RetrofitMovieBookingDataAgentImpl._internal();

  factory RetrofitMovieBookingDataAgentImpl(){
    return _singleton;
  }

  RetrofitMovieBookingDataAgentImpl._internal(){
    final dio = Dio();
    mApi = TheAppApi(dio);
  }
  @override
  Future<OtpVO?> postPhoneNumber(int phoneNumber) {
    return mApi
        .postPhoneNumber(phoneNumber).then((value) {
      debugPrint(value.toString());
    });
  }
}