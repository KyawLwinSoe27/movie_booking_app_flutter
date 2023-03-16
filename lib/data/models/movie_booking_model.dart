import '../vos/authentication_vo.dart';
import '../vos/otp_vo.dart';

abstract class MovieBookingModel
{
  Future<OtpVO?> postPhoneNumber(int phoneNumber);
}