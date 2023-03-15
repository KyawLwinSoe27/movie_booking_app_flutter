import 'package:flutter/material.dart';

import '../resources/dimensions.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  const AppBarTitle(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
          fontWeight: FontWeight.w700),
    );
  }
}
