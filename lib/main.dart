import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/seat_selection.dart';
import 'package:movie_booking_app/pages/choose_time_and_cinema.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import 'package:movie_booking_app/pages/logo_page.dart';
import 'package:movie_booking_app/pages/movie_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:SeatSelectionPage(),
    );
  }
}


