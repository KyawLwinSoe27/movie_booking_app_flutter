import 'package:flutter/material.dart';

import '../resources/dimensions.dart';

class CRDWidgetView extends StatelessWidget {
  final String firstText;
  final String secondText;
  const CRDWidgetView(this.firstText,this.secondText,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                color: Color.fromRGBO(51, 51, 51, 0.5))
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(34, 34, 34, 0.8),
                Color.fromRGBO(17, 17, 17, 0.6)
              ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: MARGIN_SMALL_2X,),
            Text(secondText,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}