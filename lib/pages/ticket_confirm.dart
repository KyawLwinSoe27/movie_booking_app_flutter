import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../common_widgets/date_time_place_widget.dart';
import '../common_widgets/movie_name.dart';
import '../common_widgets/number_of_tickets.dart';
import '../resources/dimensions.dart';

class TicketConfirmPage extends StatefulWidget {
  const TicketConfirmPage({Key? key}) : super(key: key);

  @override
  State<TicketConfirmPage> createState() => _TicketConfirmPageState();
}

class _TicketConfirmPageState extends State<TicketConfirmPage> {
  bool showReceipt = true;
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, () {
      setState(() {
        showReceipt = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TicketConfirmationWidget(),
        Visibility(visible: showReceipt, child: BookSuccessSplashScreen()),
      ],
    );
  }
}

class BookSuccessSplashScreen extends StatelessWidget {
  const BookSuccessSplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.9),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 160),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "images/Ballon.png",
                  width: 388,
                  height: 320,
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: Image.asset(
                      "images/home_cinema.png",
                      width: 154,
                      height: 147,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MARGIN_SMALL_20,
            ),
            Text(
              "Your Booked is Success.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            Text(
              "Enjoy the Movie.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketConfirmationWidget extends StatelessWidget {
  const TicketConfirmationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        centerTitle: true,
        title: Text(
          "Ticket Confirmation",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ReceiptWidget(),
            SizedBox(
              height: 60,
            ),
            Container(
              child: Column(
                children: [
                  QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    size: 120.0,
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: MARGIN_SMALL_20,
                  ),
                  Text(
                    "WAG5LP1C",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "TPIN:",
                          style: TextStyle(
                              color: LOGIN_SCREEN_SUB_TXT_COLOR,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "WKCSL96",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                router(context, HomePage());
              },
              child: FinalButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalButtonWidget extends StatelessWidget {
  const FinalButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
        child: Text(
          "DONE",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MARGIN_MEDIUM_2X, left: MARGIN_SMALL_2X),
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

// Container(
// margin: EdgeInsets.only(top: 30),
// child: Column(
// children: [
// Container(
// margin: EdgeInsets.symmetric(horizontal: 112),
// child: Text(
// "Ticket Confirmation",
// style: TextStyle(
// color: Colors.white,
// fontSize: LOGO_TXT_FONT_SIZE,
// fontWeight: FontWeight.w700),
// ),
// ),
// Container(),
// Container(),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 125),
// child: MaterialButton(
// onPressed: () {},
// child: Text(
// "DONE",
// style: TextStyle(
// fontWeight: FontWeight.w600,
// fontSize: LOGO_TXT_FONT_SIZE,
// color: Colors.black),
// ),
// ),
// ),
// ],
// ),
// )
