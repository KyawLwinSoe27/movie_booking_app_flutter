import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimensions.dart';
import 'package:movie_booking_app/resources/strings.dart';

import '../common_widgets/logo_widgets.dart';
import '../data/vos/cities_vo.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  MovieBookingModel movieBookingModel = MovieBookingModelImpl();

  //State Variables
  List<CitiesVO>? cities;

  @override
  void initState() {


    movieBookingModel.getCities().then((citiesList) {
      setState(() {
        cities = citiesList;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    super.initState();
    _NavigateToAnotherScreen();
    //  startTime();
  }

  void _NavigateToAnotherScreen(){
    movieBookingModel.getUserDataFromDatabase().then((user) async {
      print(user?.token);
      if(user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }else {
        await startTime();
      }
    });
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      router(context, const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LogoWidget(),
          SizedBox(
            height: MARGIN_SMALL_2X,
          ),
          LogoScreenTextWidget(),
        ],
      )),
    );
  }
}

class LogoScreenTextWidget extends StatelessWidget {
  const LogoScreenTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          style: TextStyle(
            fontSize: LOGO_TXT_FONT_SIZE,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: LOGO_CHAR,
              style: TextStyle(color: PRIMARY_COLOR),
            ),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(
                  right: MARGIN_SMALL_1X,
                ),
              ),
            ),
            TextSpan(
              text: LOGO_TITLE,
              style: TextStyle(
                color: LOGO_TXT_COLOR,
              ),
            )
          ]),
    );
  }
}
