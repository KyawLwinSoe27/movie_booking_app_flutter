import 'package:flutter/material.dart';

import '../functions/reuse_functions.dart';
import '../resources/colors.dart';

class BookingButton extends StatelessWidget {
  final String text;
  final Widget widget;
  final Color color;
  const BookingButton(this.text,this.widget,[this.color = PRIMARY_COLOR]);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        router(context, widget);
      },
      child: Container(
        width: 230,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: BACKGROUND_COLOR,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: (color == PRIMARY_COLOR) ? Colors.black : Colors.white),),
            Spacer(),
            SizedBox(
              height: 20,
              width: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: BACKGROUND_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}