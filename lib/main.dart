import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/coming_soon_movie_details.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import 'package:movie_booking_app/pages/logo_page.dart';
import 'package:movie_booking_app/pages/now_showing_movie_details.dart';

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
      home: NowShowingMovieDetails(),
    );
  }
}


