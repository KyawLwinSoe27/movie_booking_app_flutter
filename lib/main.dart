import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/pages/checkout.dart';
import 'package:movie_booking_app/pages/cinema_details.dart';
import 'package:movie_booking_app/pages/food_order_page.dart';
import 'package:movie_booking_app/pages/payment.dart';
import 'package:movie_booking_app/pages/seat_selection.dart';
import 'package:movie_booking_app/pages/choose_time_and_cinema.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import 'package:movie_booking_app/pages/logo_page.dart';
import 'package:movie_booking_app/pages/movie_details.dart';
import 'package:movie_booking_app/pages/ticket_confirm.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';
import 'data/vos/cities_vo.dart';
import 'data/vos/user_data_vo.dart';

void main() async {
  await Hive.initFlutter();
  /// Register adapter

  Hive.registerAdapter(CitiesVOAdapter());
  Hive.registerAdapter(UserDataVOAdapter());

  /// Open box
  await Hive.openBox<CitiesVO>(BOX_NAME_CITY_VO);
  await Hive.openBox<UserDataVO>(BOX_NAME_USER_DATA_VO);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MovieBookingModel movieBookingModel = MovieBookingModelImpl();

  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: LogoPage(),
      home:LogoPage(),
    );
  }
}


