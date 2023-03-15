import '../vos/authentication_vo.dart';

abstract class MovieBookingModel
{
  Future<AuthenticationVO?> postPhoneNumber(int phoneNumber);
}