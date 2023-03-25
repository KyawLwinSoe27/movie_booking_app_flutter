import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie_booking_app/data/vos/otp_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_data_agent.dart';
import 'package:movie_booking_app/network/dataagents/retrofit_movie_booking_data_agent_impl.dart';
import 'package:movie_booking_app/persistence/daos/user_data_dao.dart';

import '../../network/responses/log_out_response.dart';
import '../../network/responses/user_account_response.dart';
import '../../persistence/daos/cities_dao.dart';
import '../vos/banner_vo.dart';
import '../vos/cinema_vo.dart';
import '../vos/cities_vo.dart';
import '../vos/movies_vo.dart';
import '../vos/seat_vo.dart';
import 'movie_booking_model.dart';

class MovieBookingModelImpl extends MovieBookingModel
{
  static final MovieBookingModelImpl _singleton = MovieBookingModelImpl._internal();

  factory MovieBookingModelImpl() {
    return _singleton;
  }

  MovieBookingModelImpl._internal(); //ရေးစရာဘာမှမရှိ

  final MovieBookingDataAgent _dataAgent = RetrofitMovieBookingDataAgentImpl();

  /// Daos
  final CitiesDao _mCitiesDoa = CitiesDao();
  final UserDataDao _mUserDataDao = UserDataDao();

  /// Network
  @override
  Future<OtpVO?> postPhoneNumber(String phoneNumber) {
    return _dataAgent.postPhoneNumber(phoneNumber);
  }

  @override
  Future<UserDataVO?> postOtp(String phone, String otp) {
    // return _dataAgent.postOtp(phone, otp);
    return _dataAgent.postOtp(phone, otp).then((userInfo) async{
      if(userInfo != null){
        _mUserDataDao.saveAllUserData(userInfo);
      }
      return Future.value(userInfo);
    });
  }

  @override
  Future<List<CitiesVO>?> getCities(){
    return _dataAgent.getCities().then((cities) async{
      if(cities != null){
        _mCitiesDoa.saveAllCities(cities);
      }
      return Future.value(cities);
    });
  }

  @override
  Future<LogOutResponse?> postLogOut(String token)
  {
    return _dataAgent.postLogOut(token);
  }

  @override
  Future<List<BannerVO>?> getBanner(){
    return _dataAgent.getBanner();
  }

  @override
  Future<List<MoviesVO>?> getMovies(String status)
  {
    return _dataAgent.getMovies(status);
  }

  @override
  Future<MoviesVO?> getMovieDetails(int movieId)
  {
    return _dataAgent.getMovieDetails(movieId);
  }

  @override
  Future<List<CinemaVO>?> getCinemaAndShowtime(String token, String date){
    return _dataAgent.getCinemaAndShowtime(token, date).then((value) {
      value?.map((e) {
        e.isExpanded = false;
      }).toList();
      return value;
    });
  }

  @override
  Future<List<List<SeatVO>?>?> getCinemaSeatingPlan(String token, int cinemaDayTimeslotsId, String bookingDate){
    return _dataAgent.getCinemaSeatingPlan(token, cinemaDayTimeslotsId.toString(),bookingDate).then((value) {
      for(int i = 0; i < value!.length; i++){
        value[i]?.insert(5, SeatVO(0, "space", "", "", 0));
        value[i]?.insert(6, SeatVO(0, "space", "", "", 0));
        value[i]?.insert(11, SeatVO(0, "space", "", "", 0));
        value[i]?.insert(12, SeatVO(0, "space", "", "", 0));
      }
      return value;
    });
  }



  /// From Database
  @override
  Future<List<CitiesVO>?> getCitiesFromDatabase()
  {
    return Future.value(
      _mCitiesDoa.getAllCities()
    );
  }

  @override
  Future<UserDataVO> getUserDataFromDatabase(){
    return Future.value(
      _mUserDataDao.getUserData()
    );
  }

  @override
  bool deleteUserDataFromDatabase(){
    Future.value(
      _mUserDataDao.deleteUserData()
    );
      return true;
  }

}