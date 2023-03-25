import 'package:dio/dio.dart';
import 'package:movie_booking_app/data/vos/otp_vo.dart';
import 'package:movie_booking_app/network/responses/get_banner_response.dart';
import 'package:movie_booking_app/network/responses/get_cinema_and_showtime_response.dart';
import 'package:movie_booking_app/network/responses/get_cinema_seating_plan_response.dart';
import 'package:movie_booking_app/network/responses/get_cities_response.dart';
import 'package:movie_booking_app/network/responses/get_movie_details_response.dart';
import 'package:movie_booking_app/network/responses/get_movies_response.dart';
import 'package:movie_booking_app/network/responses/log_out_response.dart';
import 'package:movie_booking_app/network/responses/user_account_response.dart';
import 'package:retrofit/http.dart';

import '../data/vos/movies_vo.dart';
import 'api_constant.dart';

part 'the_app_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheAppApi
{
  factory TheAppApi(Dio dio) = _TheAppApi;

  @POST(GET_OTP)
  Future<OtpVO?> postPhoneNumber(
    @Field() String phone
      );

  
  @POST(SIGN_IN_WITH_PHONE)
  Future<UserAccountResponse?> postOtp(
      @Field() String phone,
      @Field() String otp
      );

  @GET(GET_CITIES)
  Future<GetCitiesResponse?> getCities();

  @POST(LOG_OUT)
  Future<LogOutResponse?> postLogOut(
      @Header("Authorization") String token
      );

  @GET(GET_BANNER)
  Future<GetBannerResponse?> getBanner();

  @GET(GET_MOVIES)
  Future<GetMoviesResponse?> getMovies(
      @Query(STATUS) String status
      );
  
  @GET("$GET_MOVIE_DETAILS/{movie_id}")
  Future<GetMovieDetailsResponse?> getMovieDetails(
      @Path("movie_id") String movieId,
      );

  @GET(GET_CINEMA_AND_SHOWTIME)
  Future<GetCinemaAndShowtimeResponse?> getCinemaAndShowtime(
      @Header(AUTHORIZATION) String token,
      @Query(DATE) String date
      );
  
  @GET(GET_CINEMA_SEATING_PLAN)
  Future<GetCinemaSeatingPlanResponse?> getCinemaSeatingPlan(
      @Header(AUTHORIZATION) String token,
      @Query(CINEMA_DAY_TIMESLOTS_ID) String cinemaDayTimeslotsId,
      @Query(BOOKING_DATE) String bookingDate
      );
}



// bro does it need to run build_runner ? yes i ll do