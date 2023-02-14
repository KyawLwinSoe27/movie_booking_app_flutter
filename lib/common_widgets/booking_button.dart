import 'package:flutter/material.dart';

import '../functions/reuse_functions.dart';
import '../resources/colors.dart';

class BookingButton extends StatelessWidget {
  final String text;
  final Widget widget;
  const BookingButton(this.text,this.widget,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        router(context, widget);
      },
      child: Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
              children: [Container(
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),)),
              ),
                Positioned(
                  left: -10,
                  top: 16,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BACKGROUND_COLOR,
                    ),
                  ),
                ),
                Positioned(
                  right: -10,
                  top: 16,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BACKGROUND_COLOR,
                    ),
                  ),
                ),
              ]
          )
      ),
    );
  }
}