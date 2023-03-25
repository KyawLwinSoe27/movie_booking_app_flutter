import 'package:movie_booking_app/data/vos/otp_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/responses/user_account_response.dart';

import '../../data/vos/banner_vo.dart';
import '../../data/vos/cinema_vo.dart';
import '../../data/vos/cities_vo.dart';
import '../../data/vos/movies_vo.dart';
import '../../data/vos/seat_vo.dart';
import '../responses/log_out_response.dart';

abstract class MovieBookingDataAgent
{
  Future<OtpVO?> postPhoneNumber(String phoneNumber);
  Future<UserDataVO?> postOtp(String phone, String otp);
  Future<List<CitiesVO>?> getCities();
  Future<LogOutResponse?> postLogOut(String token);
  Future<List<BannerVO>?> getBanner();
  Future<List<MoviesVO>?> getMovies(String status);
  Future<MoviesVO?> getMovieDetails(int movieId);
  Future<List<CinemaVO>?> getCinemaAndShowtime(String token,String date);
  Future<List<List<SeatVO>?>?> getCinemaSeatingPlan(String token, String cinemaDayTimeslotsId, String bookingDate);
}