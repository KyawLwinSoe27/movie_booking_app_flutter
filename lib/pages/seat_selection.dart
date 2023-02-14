import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/choose_time_and_cinema.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../common_widgets/booking_button.dart';
import '../functions/reuse_functions.dart';
import '../resources/dimensions.dart';
import 'food_order_page.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({Key? key}) : super(key: key);

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: GestureDetector(
            onTap: () {
              router(context, const ChooseTimeAndCinema());
            },
            child: const Icon(
              Icons.chevron_left,
              size: CHEVRON_LEFT_FONT_SIZE,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TVScreenWidget(),
            Container(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SeatTypeAndPriceTextWidget("Normal (4500ks)");
                  } else if (index == 3) {
                    return SeatTypeAndPriceTextWidget("Executive (6500ks)");
                  } else if(index == 6){
                    return SeatTypeAndPriceTextWidget("Premium (8500ks)");
                  } else if(index == 9) {
                    return SeatTypeAndPriceTextWidget("Gold (10000ks)");
                  } else if(index == 1) {
                    return  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeatRowNumber("A"),
                          SizedBox(width: MARGIN_SMALL_8,),
                          GestureDetector(onTap: () {print(context);},child: SingleSeatWidget()),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          Spacer(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SizedBox(width: MARGIN_SMALL_1X,),
                          SeatRowNumber("A"),
                        ],
                      ),
                    );
                  } else if(index == 2){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeatRowNumber("B"),
                          SizedBox(width: MARGIN_SMALL_8,),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          Spacer(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SizedBox(width: MARGIN_SMALL_1X,),
                          SeatRowNumber("B"),
                        ],
                      ),
                    );
                  } else if(index == 4) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeatRowNumber("C"),
                          SizedBox(width: MARGIN_SMALL_8,),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          Spacer(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SizedBox(width: MARGIN_SMALL_1X,),
                          SeatRowNumber("C"),
                        ],
                      ),
                    );
                  } else if(index == 5) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeatRowNumber("D"),
                          SizedBox(width: MARGIN_SMALL_8,),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          Spacer(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SizedBox(width: MARGIN_SMALL_1X,),
                          SeatRowNumber("D"),
                        ],
                      ),
                    );
                  } else if(index == 7) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeatRowNumber("E"),
                          SizedBox(width: MARGIN_SMALL_8,),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          Spacer(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SizedBox(width: MARGIN_SMALL_1X,),
                          SeatRowNumber("E"),
                        ],
                      ),
                    );
                  } else if(index == 8) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeatRowNumber("F"),
                          SizedBox(width: MARGIN_SMALL_8,),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          Spacer(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SingleSeatWidget(),
                          SizedBox(width: MARGIN_SMALL_1X,),
                          SeatRowNumber("F"),
                        ],
                      ),
                    );
                  } else if(index == 10) {
                    return CoupleChair();
                  } else if(index == 11) {
                    return CoupleChair();
                  } else {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10,),
                    );
                  }
                },
              ),
            ),
            SeatConditionWidget(),
            ZoomWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("2 Tickets",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700,),),
                      SizedBox(height: 3,),
                      Text("17000KS",style: TextStyle(color: PRIMARY_COLOR,fontSize: 20,fontWeight: FontWeight.w700,),)
                    ],
                  ),
                  Spacer(),
                  BookingButton("Buy Tickets",FoodOrder()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ZoomWidget extends StatelessWidget {
  const ZoomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,),
      height: 30,
      width: 300,
      color: Colors.white,
    );
  }
}

class SeatConditionWidget extends StatelessWidget {
  const SeatConditionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(34, 34, 34, 1),
      height: 37,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
        child: Row(
          children: [
            IconAndTextWidget("Available", Colors.white),
            Spacer(),
            IconAndTextWidget("Filling Fast", HOME_PAGE_TAB_CENTER_BG),
            Spacer(),
            IconAndTextWidget("Almost Full", PRIMARY_COLOR),
          ],
        ),
      ),
    );
  }
}
class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      this.text,
      this.color, {
        Key? key,
      }) : super(key: key);

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              border: Border.all(color: LOGIN_SCREEN_SUB_TXT_COLOR),
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL_2X,
          ),
          Text(
            text,
            style: TextStyle(
                color: LOGIN_SCREEN_SUB_TXT_COLOR, fontWeight: FontWeight.w500, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class SingleSeatWidget extends StatefulWidget {
  const SingleSeatWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SingleSeatWidget> createState() => _SingleSeatWidgetState();
}

class _SingleSeatWidgetState extends State<SingleSeatWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? isSelected = false : isSelected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10,),
        width: 30,
        height: 30,
        child: isSelected ? Image.asset("images/SelectedChair.png") : Image.asset("images/TakenChair.png"),
      ),
    );
  }
}

class CoupleChair extends StatelessWidget {
  const CoupleChair({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SeatRowNumber("H"),
          SizedBox(width: MARGIN_SMALL_8,),
          Container(
            height: 50,
            width: 50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("images/CoupleSeat.png",),
                );
              },
            ),
          ),
          Spacer(),
          Container(
            height: 30,
            width: 180,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("images/TakenChair.png"),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("images/CoupleSeat.png",),
                );
              },
            ),
          ),
          SizedBox(width: MARGIN_SMALL_8,),
          SeatRowNumber("H"),
        ],
      ),
    );
  }
}


class SeatRowNumber extends StatelessWidget {
  final String rowNumber;
  const SeatRowNumber(this.rowNumber,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(rowNumber,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(68, 68, 68, 1),),);
  }
}

class SeatTypeAndPriceTextWidget extends StatelessWidget {
  final String text;
  const SeatTypeAndPriceTextWidget(this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      style: TextStyle(
          fontSize: 16.56,
          color: Color.fromRGBO(136, 136, 136, 1),
          fontWeight: FontWeight.w400),
    ));
  }
}

class TVScreenWidget extends StatelessWidget {
  const TVScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.asset("images/Ellipse.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "SCREEN",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
