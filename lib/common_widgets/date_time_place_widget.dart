import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimensions.dart';

class DateAndTimeAndPlaceWidget extends StatelessWidget {
  const DateAndTimeAndPlaceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconAndText(Icons.calendar_month_outlined, "Sat 18 Jun, 2022"),
          SizedBox(
            width: 10,
          ),
          IconAndText(Icons.access_time, "3:30PM"),
          SizedBox(
            width: 10,
          ),
          IconAndText(
              Icons.place, "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon "),
        ],
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconAndText(
      this.icon,
      this.text, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: PRIMARY_COLOR,
              size: 20,
            ),
            SizedBox(
              height: MARGIN_SMALL_2X,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}