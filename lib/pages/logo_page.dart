import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimensions.dart';
import 'package:movie_booking_app/resources/strings.dart';

import '../common_widgets/logo_widgets.dart';

class LogoPage extends StatefulWidget {
  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return Timer(duration, () {
      router(context, LoginPage());
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
        children: [
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
      text: TextSpan(
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
                padding: const EdgeInsets.only(
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
