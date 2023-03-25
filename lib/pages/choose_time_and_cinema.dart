import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/seat_selection.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../data/vos/cinema_vo.dart';
import '../resources/dimensions.dart';
import 'home_page.dart';

class ChooseTimeAndCinema extends StatefulWidget {
  final String token;
  const ChooseTimeAndCinema({Key? key, required this.token}) : super(key: key);

  @override
  State<ChooseTimeAndCinema> createState() => _ChooseTimeAndCinemaState();
}

class _ChooseTimeAndCinemaState extends State<ChooseTimeAndCinema> {
  final MovieBookingModel _movieBookingModel = MovieBookingModelImpl();
  //Date Implementation
  List<DateTime> dateList = [];
  DateTime date = DateTime.now();


  // Variable
  String? chooseDate;
  String? bookingDate;
  List<CinemaVO>? cinemaAndShowtime;

  Future<List<CinemaVO>?> getCinemaAndShowtime(date) async {
    await _movieBookingModel.getCinemaAndShowtime("Bearer ${widget.token}",date).then((cinema) {
      setState(() {
        this.cinemaAndShowtime = cinema;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });
    return null;
  }
  @override

  void initState() {

    for (int i = 1; i <= 14; i++) {
      setState(() {
        dateList.add(date.add(Duration(days: i)));
      });
    }
    
    setState(() {
      chooseDate = dateList[0].toString().substring(0, 10);
    });

    getCinemaAndShowtime(chooseDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: GestureDetector(
            onTap: () {
              router(context, HomePage());
            },
            child: const Icon(
              Icons.chevron_left,
              size: CHEVRON_LEFT_FONT_SIZE,
            )),
        actions: const [
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
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            DateCardListsWidgetView(
              dateList: dateList,
              chooseDate: chooseDate,
              onTap: (bookingDate) {
                setState(() {
                  this.bookingDate = bookingDate;
                });
                getCinemaAndShowtime(bookingDate);
              },
            ),
            const MovieTypeWidgetView(),
            const SeatAvailableConditionWidgetView(),
            const SizedBox(height: MARGIN_SMALL_30,),
            MovieShowTimeWidgets(cinemaAndShowtime : cinemaAndShowtime, bookingDate : bookingDate ?? "", token : widget.token)
          ],
        ),
      ),
    );
  }
}

class MovieShowTimeWidgets extends StatefulWidget {
  MovieShowTimeWidgets({
    Key? key,
    required this.cinemaAndShowtime,
    required this.bookingDate,
    required this.token,
  }) : super(key: key);

  List<CinemaVO>? cinemaAndShowtime;
  final String bookingDate;
  final String token;

  @override
  State<MovieShowTimeWidgets> createState() => _MovieShowTimeWidgetsState();
}

class _MovieShowTimeWidgetsState extends State<MovieShowTimeWidgets> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: widget.cinemaAndShowtime?.length ?? 1,
        itemBuilder: (BuildContext context, int index) {

          final CinemaVO? cinemaAndShowtime = widget.cinemaAndShowtime?[index];

          return Container(
            margin:const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cinemaAndShowtime?.isExpanded = cinemaAndShowtime.isExpanded == true ? false : true;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        cinemaAndShowtime?.cinema ?? "",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      const Text("See Details",
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                const SizedBox(height: MARGIN_SMALL_20,),
                Row(children:const [
                  CinemaServiceWidgets(
                      Icons.local_parking_outlined, "Parking"),
                  SizedBox(
                    width: MARGIN_SMALL_1X,
                  ),
                  CinemaServiceWidgets(Icons.fastfood, "Online Food"),
                  SizedBox(
                    width: MARGIN_SMALL_1X,
                  ),
                  CinemaServiceWidgets(
                      Icons.wheelchair_pickup, "Wheel Chair"),
                ]),
                const SizedBox(height: MARGIN_SMALL_2X,),
                Visibility(
                  visible: cinemaAndShowtime?.isExpanded == true,
                    child: Column(
                      children: [
                        MovieShowTimeGridWidget(showTime : cinemaAndShowtime?.timeslots, date : widget.bookingDate, token: widget.token),
                        MovieShowTimeBottomIconAndTextWidget(),
                      ],
                    ),)
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>const Divider(
          color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
        ),
      ),
    );
  }
}

class MovieShowTimeGridWidget extends StatelessWidget {
  const MovieShowTimeGridWidget({
    Key? key, required this.showTime,
    required this.date,
    required this.token,
  }) : super(key: key);

  final List<TimeslotsVO>? showTime;
  final String date;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: MARGIN_SMALL_20,),
      height: 250,
      child: GridView.builder(
        itemCount: showTime?.length,
        physics:const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            crossAxisSpacing: 30,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, int index) {
          final TimeslotsVO? timeslots = showTime?[index];
          return GestureDetector(
              onLongPress: () {
                router(context, SeatSelectionPage(date : date, timeslotId : timeslots?.cinemaDayTimeslotId ?? 0, token : token));
              },
            child: Container(
              width: 95,
              height: 92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(255, 122, 0, 0.1),
                  border: Border.all(color: Color.fromRGBO(255, 107, 0, 1))),
              child: Column(
                children: [
                  const SizedBox(
                    height: MARGIN_SMALL_1X,
                  ),
                  Text(
                    timeslots?.startTime ?? "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MARGIN_SMALL_1X,
                  ),
                  Text("3D",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SizedBox(
                    height: MARGIN_SMALL_1X,
                  ),
                  Text("Screen 1",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SizedBox(
                    height: MARGIN_SMALL_1X,
                  ),
                  Text("21 Available",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))
                ],
              ),
            ),
          );
        },
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
    return Row(
      children: const [
        Icon(Icons.info_sharp, color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR),
        SizedBox(
          width: MARGIN_SMALL_1X,
        ),
        Text(
          "Long press on show timing to see seat class!",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR),
        )
      ],
    );
  }
}

class CinemaServiceWidgets extends StatelessWidget {
  const CinemaServiceWidgets(
    this.serviceIcon,
    this.serviceTitle, {
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
              border:
                  Border.all(color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR, width: 2),
            ),
            child: Icon(
              serviceIcon,
              size: 10,
              color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL_1X,
          ),
          Text(
            serviceTitle,
            style: TextStyle(
                color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          )
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

class DateCardListsWidgetView extends StatefulWidget {
  DateCardListsWidgetView({
    Key? key,
    required this.dateList,
    required this.chooseDate,
    required this.onTap,
  }) : super(key: key);

  final List<DateTime> dateList;
  String? chooseDate;
  Function (String) onTap;
  @override
  State<DateCardListsWidgetView> createState() =>
      _DateCardListsWidgetViewState();
}

class _DateCardListsWidgetViewState extends State<DateCardListsWidgetView> {
  int selectedDate = 0;
  String? bookingDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dateList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 20),
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = index;
                    String date = widget.dateList[selectedDate]
                        .toString()
                        .substring(0, 10);
                    widget.chooseDate = date;
                  });
                  bookingDate = widget.chooseDate!;
                  widget.onTap(bookingDate ?? "");
                },
                child: Container(
                  width: 71,
                  height: 95,
                  decoration: BoxDecoration(
                    color: selectedDate == index
                        ? PRIMARY_COLOR
                        : Color.fromRGBO(215, 215, 215, 1),
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
                          DateFormat("EEE").format(widget.dateList[index]),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(DateFormat.MMMM().format(widget.dateList[index]),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(widget.dateList[index].day.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                      ],
                    ),
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
