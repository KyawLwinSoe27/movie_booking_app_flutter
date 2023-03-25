import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_booking_app/data/vos/otp_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_data_agent.dart';
import 'package:movie_booking_app/network/responses/user_account_response.dart';
import 'package:movie_booking_app/network/the_app_api.dart';

import '../../data/vos/banner_vo.dart';
import '../../data/vos/cinema_vo.dart';
import '../../data/vos/cities_vo.dart';
import '../../data/vos/movies_vo.dart';
import '../../data/vos/seat_vo.dart';
import '../responses/log_out_response.dart';

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
  Future<OtpVO?> postPhoneNumber(String phoneNumber) {
    return mApi
        .postPhoneNumber(phoneNumber);
  }

  @override
  Future<UserDataVO?> postOtp(String phone, String otp) {
    return mApi
        .postOtp(phone, otp).then((response) {
          response?.userData?.token = response.token;
          return response?.userData;
        });
  }

  @override
  Future<List<CitiesVO>?> getCities(){
    return mApi
        .getCities().then((response) => response?.cities);
  }

  @override
  Future<LogOutResponse?> postLogOut(String token){
    return mApi.postLogOut(token);
  }

  @override
  Future<List<BannerVO>?> getBanner(){
    return mApi.getBanner().asStream().map((response) => response?.banner).first;
  }

  @override
  Future<List<MoviesVO>?> getMovies(String status){
    return mApi.getMovies(status).asStream().map((response) => response?.movies).first;
  }

  @override
  Future<MoviesVO?> getMovieDetails(int movieId){
    return mApi.getMovieDetails(movieId.toString()).asStream().map((response) => response?.movie).first;
  }

  @override
  Future<List<CinemaVO>?> getCinemaAndShowtime(String token,String date){
   return mApi.getCinemaAndShowtime(token,date).asStream().map((response) => response?.cinema).first;
  }

  // String token, String cinemaDayTimeslotsId, String bookingDate
  @override
  Future<List<List<SeatVO>?>?> getCinemaSeatingPlan(String token, String cinemaDayTimeslotsId, String bookingDate){
    return mApi.getCinemaSeatingPlan(token,cinemaDayTimeslotsId,bookingDate).asStream().map((response) => response?.data).first;
  }

}