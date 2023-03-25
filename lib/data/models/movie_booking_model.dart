import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/responses/log_out_response.dart';

import '../../network/responses/user_account_response.dart';
import '../vos/banner_vo.dart';
import '../vos/cinema_vo.dart';
import '../vos/cities_vo.dart';
import '../vos/movies_vo.dart';
import '../vos/otp_vo.dart';
import '../vos/seat_vo.dart';

abstract class MovieBookingModel
{
  /// FROM NETWORK
  Future<OtpVO?> postPhoneNumber(String phoneNumber);
  Future<UserDataVO?> postOtp(String phone, String otp);
  Future<List<CitiesVO>?> getCities();
  Future<LogOutResponse?> postLogOut(String token);
  Future<List<BannerVO>?> getBanner();
  Future<List<MoviesVO>?> getMovies(String status);
  Future<MoviesVO?> getMovieDetails(int movieId);
  Future<List<CinemaVO>?> getCinemaAndShowtime(String token, String date);
  Future<List<List<SeatVO>?>?> getCinemaSeatingPlan(String token, int cinemaDayTimeslotsId, String bookingDate);

  /// FROM DATABASE
  Future<List<CitiesVO>?> getCitiesFromDatabase();
  Future<UserDataVO?> getUserDataFromDatabase();
  bool deleteUserDataFromDatabase();
}