import 'package:flutter/material.dart';

class RatingWidgetView extends StatelessWidget {
  final String rating;
  const RatingWidgetView(this.rating,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      rating,
      style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700),
    );
  }
}