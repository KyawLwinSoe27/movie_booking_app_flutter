import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../common_widgets/date_time_place_widget.dart';
import '../common_widgets/movie_name.dart';
import '../common_widgets/number_of_tickets.dart';

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MARGIN_MEDIUM_1X, left: MARGIN_SMALL_2X),
      width: 370,
      height: 304,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                RECEIPT_TOP_COLOR,
                RECEIPT_SECOND_COLOR,
                RECEIPT_THIRD_COLOR,
                RECEIPT_BOTTOM_COLOR
              ])),
      child: Column(
        children: [
          Container(
            height: 120,
            margin: EdgeInsets.only(left: 17, top: 16, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    "images/movie_png_receipt.png",
                    width: 96,
                    height: 120,
                  ),
                ),
                SizedBox(
                  width: 19,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieName("Black Widow", "(3D)", "(U/A)"),
                      Spacer(),
                      CinemaAndScreen("JCGV : Junction City "),
                      Spacer(),
                      NumberOfTicketsWidget("2"),
                      Spacer(),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Gold-G8,G7",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "(SCREEN 2)",
                              style: TextStyle(
                                color: LOGIN_SCREEN_SUB_TXT_COLOR,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 20,
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
                Expanded(
                  child: LayoutBuilder(
                    builder: (BuildContext context, constraints) {
                      return Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        direction: Axis.horizontal,
                        children: List.generate(
                          (constraints.constrainWidth() / 10).floor(),
                              (index) => SizedBox(
                            height: 1,
                            width: 5,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: BACKGROUND_COLOR,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: DateAndTimeAndPlaceWidget(),
          ),
        ],
      ),
    );
  }
}


class CinemaAndScreen extends StatelessWidget {
  final String cinema;
  const CinemaAndScreen(
      this.cinema, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        cinema,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: PRIMARY_COLOR),
      ),
    );
  }
}