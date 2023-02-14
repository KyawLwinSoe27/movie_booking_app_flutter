import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/seat_selection.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../resources/dimensions.dart';
import 'home_page.dart';

class ChooseTimeAndCinema extends StatefulWidget {
  const ChooseTimeAndCinema({Key? key}) : super(key: key);

  @override
  State<ChooseTimeAndCinema> createState() => _ChooseTimeAndCinemaState();
}

class _ChooseTimeAndCinemaState extends State<ChooseTimeAndCinema> {
  //Date Implementation
  List<DateTime> dateList = [];
  DateTime date = DateTime.now();

  //Movie Station
  List<String> movieStation = [
    "JCGV : Junction City",
    "JCGV : City Mall",
    "Mingalar Cinema Gold Class"
  ];

  @override
  Widget build(BuildContext context) {
    for (int i = 1; i <= 7; i++) {
      dateList.add(date.add(Duration(days: i - 1)));
    }

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: GestureDetector(
            onTap: () {
              router(context, HomePage());
            },
            child: Icon(
              Icons.chevron_left,
              size: CHEVRON_LEFT_FONT_SIZE,
            )),
        actions: [
          Icon(Icons.near_me, size: HOME_PAGE_BANNER_DISCOUNT_PERCENT),
          SizedBox(
            width: MARGIN_SMALL_8,
          ),
          Center(
            child: Text(
              "Yangon",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL_20,
          ),
          Icon(Icons.search, size: HOME_PAGE_BANNER_DISCOUNT_PERCENT),
          SizedBox(
            width: MARGIN_SMALL_20,
          ),
          Icon(Icons.filter_alt, size: HOME_PAGE_BANNER_DISCOUNT_PERCENT),
          SizedBox(
            width: MARGIN_SMALL_2X,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DateCardListsWidgetView(dateList: dateList),
            MovieTypeWidgetView(),
            SeatAvailableConditionWidgetView(),
            MovieShowTimeWidgets(movieStation: movieStation)
          ],
        ),
      ),
    );
  }
}

class MovieShowTimeWidgets extends StatelessWidget {
  const MovieShowTimeWidgets({
    Key? key,
    required this.movieStation,
  }) : super(key: key);

  final List<String> movieStation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(
              movieStation[index],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            trailing: Text("See Details",style: TextStyle(color: PRIMARY_COLOR,decoration: TextDecoration.underline)),
            subtitle: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CinemaServiceWidgets(Icons.local_parking_outlined,"Parking"),
                  SizedBox(width: MARGIN_SMALL_1X,),
                  CinemaServiceWidgets(Icons.fastfood,"Online Food"),
                  SizedBox(width: MARGIN_SMALL_1X,),
                  CinemaServiceWidgets(Icons.wheelchair_pickup,"Wheel Chair"),
                ],
              ),
            ),
            children: [
              MovieShowTimeGridWidget(),
              MovieShowTimeBottomIconAndTextWidget()
            ],
          );
        }, separatorBuilder: (BuildContext context, int index) =>  Divider(color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,) ,
      ),
    );
  }
}

class MovieShowTimeGridWidget extends StatelessWidget {
  const MovieShowTimeGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        router(context, SeatSelectionPage());
      },
      child: Container(
        margin: EdgeInsets.only(top: MARGIN_SMALL_20,left:MARGIN_SMALL_3X,right: MARGIN_SMALL_3X),
        height: 250,
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100,crossAxisSpacing:30,mainAxisSpacing: 20 ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 95,
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromRGBO(255, 122, 0, 0.1),
                border: Border.all(color: Color.fromRGBO(255, 107, 0, 1))
              ),
              child: Column(
                children: [
                  SizedBox(height: MARGIN_SMALL_1X,),
                  Text("9:30 AM",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                  SizedBox(height: MARGIN_SMALL_1X,),
                  Text("3D",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                  SizedBox(height: MARGIN_SMALL_1X,),
                  Text("Screen 1",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                  SizedBox(height: MARGIN_SMALL_1X,),
                  Text("21 Available",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MovieShowTimeBottomIconAndTextWidget extends StatelessWidget {
  const MovieShowTimeBottomIconAndTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_3X),
      child: Row(
        children: [
          Icon(Icons.info_sharp, color:CHOOSE_CINEMA_PAGE_SERVICE_COLOR),
          SizedBox(width: MARGIN_SMALL_1X,),
          Text("Long press on show timing to see seat class!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR),)
        ],
      ),
    );
  }
}

class CinemaServiceWidgets extends StatelessWidget {
  const CinemaServiceWidgets(this.serviceIcon,this.serviceTitle,{
    Key? key,
  }) : super(key: key);

  final IconData serviceIcon;
  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,width: 2),
            ),
            child: Icon(serviceIcon,size: 10,color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,),
          ),
          SizedBox(width: MARGIN_SMALL_1X,),
          Text(serviceTitle,style: TextStyle(color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,fontSize: 13,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}

class SeatAvailableConditionWidgetView extends StatelessWidget {
  const SeatAvailableConditionWidgetView({
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
            SeatConditionWidget("Available", Color.fromRGBO(0, 255, 163, 1)),
            Spacer(),
            SeatConditionWidget("Filling Fast", Color.fromRGBO(255, 122, 0, 1)),
            Spacer(),
            SeatConditionWidget("Almost Full", Color.fromRGBO(255, 0, 184, 1)),
          ],
        ),
      ),
    );
  }
}

class SeatConditionWidget extends StatelessWidget {
  const SeatConditionWidget(
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
                color: color, fontWeight: FontWeight.w500, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class MovieTypeWidgetView extends StatelessWidget {
  const MovieTypeWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MARGIN_SMALL_30, horizontal: MARGIN_SMALL_20),
      child: Row(
        children: [
          MovieTypeListWidget("2D"),
          Spacer(),
          MovieTypeListWidget("3D"),
          Spacer(),
          MovieTypeListWidget("3D IMAX"),
          Spacer(),
          MovieTypeListWidget("3D DBOX"),
        ],
      ),
    );
  }
}

class MovieTypeListWidget extends StatelessWidget {
  final String type;
  const MovieTypeListWidget(this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(85, 85, 85, 1),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
        child: Text(
          type,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}

class DateCardListsWidgetView extends StatelessWidget {
  const DateCardListsWidgetView({
    Key? key,
    required this.dateList,
  }) : super(key: key);

  final List<DateTime> dateList;
  @override
  Widget build(BuildContext context) {
    print(dateList.length);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 20),
            child: Stack(children: [
              Container(
                width: 71,
                height: 95,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(215, 215, 215, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        DateFormat("EEE").format(dateList[index]),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(DateFormat.MMMM().format(dateList[index]),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(dateList[index].day.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 23,
                  top: 8,
                  child: Container(
                    width: 22,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: BACKGROUND_COLOR,
                    ),
                  )),
              Positioned(
                left: -10,
                bottom: 25,
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
                bottom: 25,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BACKGROUND_COLOR,
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
