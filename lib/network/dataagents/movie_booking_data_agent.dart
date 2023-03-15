import '../../data/vos/authentication_vo.dart';

abstract class MovieBookingDataAgent
{
  Future<AuthenticationVO?> postPhoneNumber(int phoneNumber);
}