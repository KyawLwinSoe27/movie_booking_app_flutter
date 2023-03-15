import 'package:flutter/material.dart';
import 'package:movie_booking_app/common_widgets/appbar_title.dart';
import 'package:movie_booking_app/common_widgets/booking_button.dart';
import 'package:movie_booking_app/pages/payment.dart';

import '../common_widgets/back_to_widget.dart';
import '../common_widgets/date_time_place_widget.dart';
import '../common_widgets/movie_name.dart';
import '../common_widgets/number_of_tickets.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';

class CancelBooking extends StatelessWidget {
  const CancelBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: BackToWidget(),
        centerTitle: true,
        title: AppBarTitle(CANCEL_BOOKING_TITLE_TEXT),
      ),
      body: Container(
        child: Column(
          children: [
            TicketCheckoutWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(CANCEL_BOOKING_REFUNDT_TEXT,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 6,),
                      Text("15000KS",style: TextStyle(color: CANCEL_BOOKING_BUTTON_COLOR,fontSize: 20,fontWeight: FontWeight.w700))
                    ],
                  ),
                  Spacer(),
                  BookingButton(BUTTON_TEXT, PaymentPage(),CANCEL_BOOKING_BUTTON_COLOR),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TicketCheckoutWidget extends StatelessWidget {
  const TicketCheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 23, vertical: 36),
      width: 370,
      height: 618,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.5,
                1.0
              ],
              colors: [
                TICKET_BG_TOP_COLOR,
                TICKET_BG_MIDDLE_COLOR,
                TICKET_BG_TOP_COLOR,
              ])),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                MovieNameAndCinema(),
                DateAndTimeAndPlaceWidget(),
                TicketWidget(),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_3X),
                  child: Divider(
                    color: LOGIN_SCREEN_SUB_TXT_COLOR,
                  ),
                ),
                FoodAndBeverageWidget(),
              ],
            ),
          ),
          Container(
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
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Flex(
                      mainAxisSize: MainAxisSize.max,
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
                  }),
                ),
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
          Container(
            margin: EdgeInsets.only(top: MARGIN_SMALL_2X),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConvenienceFeesWidget(),
                TicketCancelWidget(),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_3X,vertical: MARGIN_SMALL_2X),
                  child: Divider(
                    color: LOGIN_SCREEN_SUB_TXT_COLOR,
                  ),
                ),
                TotalWidget()
              ],
            ),

          ),
        ],
      ),
    );
  }
}

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_30,vertical: MARGIN_SMALL_2X),
      child: Row(
        children: [
          Text("Total",style: TextStyle(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.w700),),
          Spacer(),
          Text("15000Ks",style: TextStyle(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}

class TicketCancelWidget extends StatelessWidget {
  const TicketCancelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: Border.all(color: PRIMARY_COLOR,width: 1,),
            content: Container(
              width: 320,
              height: 455,
              color: TICKET_CANCEL_DIALOG_BG,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ticket Cancelation Policy",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                    SizedBox(height: 24,),
                    F_and_B_andTicketWidget(Icons.fastfood,"100% Refund on F&B"),
                    SizedBox(height: 25,),
                    F_and_B_andTicketWidget(Icons.receipt,"Up to 75% Refund for Tickets"),
                    SizedBox(height: 25,),
                    Container(
                      margin: EdgeInsets.only(left: 55),
                      child: Column(
                        children: [
                          Text("-75% refund until 2 hours before show start time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: LOGIN_SCREEN_SUB_TXT_COLOR),),
                          SizedBox(height: 10,),
                          Text("-50% refund between 2 hours and 20 minutes before show start time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: LOGIN_SCREEN_SUB_TXT_COLOR),),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text("1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text("2.  No cancelation within 20minute of show start time.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(MARGIN_SMALL_8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 100),
                          child: Text("Close",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_3X,vertical: MARGIN_SMALL_2X),
        width: 200,
        height: 29,
        decoration: BoxDecoration(
          color: CANCEL_BOOKING_BUTTON_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_SMALL_20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline,color: Colors.white,),
              SizedBox(width: MARGIN_SMALL_1X,),
              Text("Ticket Cancelion policy",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}

class F_and_B_andTicketWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const F_and_B_andTicketWidget(this.icon,this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon,color: Colors.white,),
      SizedBox(width: 10,),
      Text(text,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
    ],);
  }
}

class ConvenienceFeesWidget extends StatelessWidget {
  const ConvenienceFeesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_3X,vertical: MARGIN_SMALL_2X),
      child: Row(
        children: [
          Text("Convenience Fee",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(width: MARGIN_SMALL_1X,),
          Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,),
          Spacer(),
          Text("500Ks",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
        ],
      ),
    );
  }
}

class FoodAndBeverageWidget extends StatelessWidget {
  const FoodAndBeverageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ExpansionTile(
          title: Row(
            children: [
              Icon(Icons.fastfood, color: Colors.white),
              SizedBox(
                width: MARGIN_SMALL_1X,
              ),
              Text(
                "Food and Beverage",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white)
            ],
          ),
          trailing: Text(
            "2000Ks",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
              child: Column(
                children: [
                  Container(
                    child: FoodItemWidget("Potatoe Chips (Qt. 1)","1000"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MARGIN_SMALL_16,bottom: 10),
                    child: FoodItemWidget("Cocala Large(Qt. 1)","1000"),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class FoodItemWidget extends StatelessWidget {
  final String foodName;
  final String price;
  const FoodItemWidget(this.foodName,this.price,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Icon(
            Icons.cancel_presentation,
            color: PRIMARY_COLOR,
          ),
        ),
        SizedBox(
          width: MARGIN_SMALL_2X,
        ),
        Text(
          foodName,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: LOGIN_SCREEN_SUB_TXT_COLOR),
        ),
        Spacer(),
        Text(
          (price+"Ks"),
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: LOGIN_SCREEN_SUB_TXT_COLOR),
        )
      ],
    );
  }
}

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23, right: 30, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [SeatNumber(), Spacer(), TicketPriceWidget()],
      ),
    );
  }
}

class SeatNumber extends StatelessWidget {
  const SeatNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NumberOfTicketsWidget("2"),
          SizedBox(
            height: MARGIN_SMALL_2X,
          ),
          Text(
            "Gold-G8,G7",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class TicketPriceWidget extends StatelessWidget {
  const TicketPriceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "20000Ks",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}

class MovieNameAndCinema extends StatelessWidget {
  const MovieNameAndCinema({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_SMALL_3X, top: MARGIN_SMALL_20),
      child: Column(
        children: [
          MovieName("Black Widow", "(3D)", "(U/A)"),
          SizedBox(
            height: 10,
          ),
          CinemaAndScreen("JCGV : Junction City", "(SCREEN 2)"),
        ],
      ),
    );
  }
}

class CinemaAndScreen extends StatelessWidget {
  final String cinema;
  final String screen;
  const CinemaAndScreen(
      this.cinema,
      this.screen, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            cinema,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: PRIMARY_COLOR),
          ),
          Text(
            screen,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR),
          )
        ],
      ),
    );
  }
}


