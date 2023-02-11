import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimensions.dart';

class Logo_Widget extends StatelessWidget {
  const Logo_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: LOGO_WIDTH,
      height: LOGO_HEIGHT,
      child: Image.asset(
        "images/logo.png",
      ),
    );
  }
}