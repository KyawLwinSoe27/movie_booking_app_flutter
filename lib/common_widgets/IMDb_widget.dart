import 'package:flutter/material.dart';

class IMDbWidgetView extends StatelessWidget {
  const IMDbWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 18,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(3)),
      child: Center(
          child: Text(
            "IMDb",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
    );
  }
}