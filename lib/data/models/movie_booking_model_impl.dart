import 'package:movie_booking_app/data/vos/authentication_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_data_agent.dart';
import 'package:movie_booking_app/network/dataagents/retrofit_movie_booking_data_agent_impl.dart';

import 'movie_booking_model.dart';

class MovieBookingModelImpl extends MovieBookingModel
{
  static final MovieBookingModelImpl _singleton = MovieBookingModelImpl._internal();

  factory MovieBookingModelImpl() {
    return _singleton;
  }

  MovieBookingModelImpl._internal(); //ရေးစရာဘာမှမရှိ

  final MovieBookingDataAgent _dataAgent = RetrofitMovieBookingDataAgentImpl(); //data agent ကို setup လုပ်ေပးရတယ်။
  @override
  Future<AuthenticationVO?> postPhoneNumber(int phoneNumber) {
    // TODO: implement postPhoneNumber
    return _dataAgent.postPhoneNumber(phoneNumber);
  }

}