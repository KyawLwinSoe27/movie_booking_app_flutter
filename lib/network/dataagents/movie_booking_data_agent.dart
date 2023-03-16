import 'package:movie_booking_app/data/vos/otp_vo.dart';

import '../../data/vos/authentication_vo.dart';

abstract class MovieBookingDataAgent
{
  Future<OtpVO?> postPhoneNumber(int phoneNumber);
}