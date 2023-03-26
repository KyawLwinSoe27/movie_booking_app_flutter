import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/pages/choose_time_and_cinema.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../common_widgets/back_to_widget.dart';
import '../common_widgets/booking_button.dart';
import '../data/vos/seat_vo.dart';
import '../resources/dimensions.dart';
import 'food_order_page.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage(
      {Key? key,
      required this.date,
      required this.timeslotId,
      required this.token})
      : super(key: key);

  final String date;
  final int timeslotId;
  final String token;

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  MovieBookingModel _movieBookigModel = MovieBookingModelImpl();



  List<Seat> userTaken = [];

  List<List<SeatVO>?>? seat;
  List<SeatVO>? seatRow;
  int totalTickets = 0;
  int totalAmounts = 0;
  List<String> seatName = [];

  double getTotalAmount() {
    double price = 0;
    userTaken.forEach((element) {
      price += element.price;
    });
    return price;
  }

  _chosen(Seat seat) {
    if (!userTaken.contains(seat)) {
      userTaken.add(seat);
    } else {
      userTaken.remove(seat);
    }
    setState(() {}); // don't understand
  }

  @override
  void initState() {
    _movieBookigModel
        .getCinemaSeatingPlan("Bearer ${widget.token}", widget.timeslotId, widget.date)
        .then((value) {
      setState(() {
        this.seat = value;
        this.seatRow = value?.first;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build ======> $totalTickets");
    print("build ======> $totalAmounts");
    print("build ======> $seatName");
    // print(widget.date);
    // print(widget.token);
    // print(widget.timeslotId);
    // print(seat?.length);
    // print(seat?[1]?[1].isSelected);
    // print(seatRow?[0].symbol);
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: BACKGROUND_COLOR,
          leading: BackToWidget(),
        ),
        body: Container(
          height: 1000,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    TVScreenWidget(),
                    Container(
                      child: Column(
                        children: [
                          const SeatTypeAndPrice("Normal(4500Ks)"),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 800,
                            child: ListView.builder(
                              itemCount: seat?.length ?? 0,
                                itemBuilder: (context, listViewIndex) {
                                  return SizedBox(
                                    height: 30,
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 18,
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 18,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 3),
                                      itemBuilder: (BuildContext context, int index) {
                                        if (seat?[listViewIndex]?[index].type == "text") {
                                          return Center(
                                            child: Text(
                                              seat?[listViewIndex]?[index].symbol ?? "",
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                          );
                                        } else if (seat?[listViewIndex]?[index].type == "space") {
                                          return Container();
                                        } else if (seat?[listViewIndex]?[index].type == "taken") {
                                          return SizedBox(
                                            child: Image.asset(
                                              "images/AvailableChair.png",
                                              color: Colors.grey,
                                            ),
                                          );
                                        } else if (seat?[listViewIndex]?[index].type == "available") {
                                          return Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  seat?[listViewIndex]?[index].isSelected == false ? seat?[listViewIndex]?[index].isSelected = true : seat?[listViewIndex]?[index].isSelected = false;
                                                  seat?[listViewIndex]?[index].isSelected == true ? totalTickets++ : totalTickets--;
                                                  seat?[listViewIndex]?[index].isSelected == true ? totalAmounts += seat?[listViewIndex]?[index].price ?? 0 : totalAmounts -= seat?[listViewIndex]?[index].price ?? 0;
                                                  seat?[listViewIndex]?[index].isSelected == true ? seatName.add(seat?[listViewIndex]?[index].seatName ?? "") : seatName.remove(seat?[listViewIndex]?[index].seatName ?? "");
                                                });
                                              },
                                              child: Image.asset(
                                                "images/AvailableChair.png",
                                                color: seat?[listViewIndex]?[index].isSelected == true ? PRIMARY_COLOR : Colors.white,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: BACKGROUND_COLOR,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SeatConditionWidget(),
                      SizedBox(
                        height: MARGIN_SMALL_20,
                      ),
                      ZoomWidget(),
                      SizedBox(
                        height: MARGIN_SMALL_20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '$totalTickets Ticket${totalTickets > 1 ? "s" : ""} ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "${totalAmounts}K${totalAmounts > 1 ? 's' : ''}",
                                  style: TextStyle(
                                    color: PRIMARY_COLOR,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            BookingButton("Buy Tickets", FoodOrder()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_SMALL_20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SeatTypeAndPrice extends StatelessWidget {
  final String seatTypeAndPrice;
  const SeatTypeAndPrice(
    this.seatTypeAndPrice, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      seatTypeAndPrice,
      style: TextStyle(
          color: LOGIN_SCREEN_SUB_TXT_COLOR,
          fontSize: 17,
          fontWeight: FontWeight.w400),
    );
  }
}

class ZoomWidget extends StatefulWidget {
  const ZoomWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ZoomWidget> createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends State<ZoomWidget> {
  double _currentValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          color: Colors.white,
        ),
        Container(
          width: WIDTH_SPACING,
          child: Slider(
              value: _currentValue,
              min: 0,
              max: 10,
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
                print(_currentValue.round().toString());
              }),
        ),
        Icon(
          Icons.remove,
          color: Colors.white,
        )
      ],
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
                color: LOGIN_SCREEN_SUB_TXT_COLOR,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          )
        ],
      ),
    );
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

class SeatWidget extends StatefulWidget {
  const SeatWidget({super.key, required this.seat, this.onSelected});

  final Seat seat;
  final Function(Seat seat)? onSelected;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!widget.seat.occupied) {
            widget.seat.chosen = !widget.seat.chosen;
            widget.onSelected!(widget.seat);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        child: Container(
          height: 30,
          width: 30,
          child: (widget.seat is SingleSeat)
              ? (widget.seat.chosen
                  ? SingleMovieSeat(PRIMARY_COLOR)
                  : widget.seat.occupied
                      ? SingleMovieSeat(Colors.black12)
                      : SingleMovieSeat(Colors.white))
              : (widget.seat.chosen
                  ? CoupleMovieSeat(PRIMARY_COLOR)
                  : widget.seat.occupied
                      ? CoupleMovieSeat(Colors.black12)
                      : CoupleMovieSeat(Colors.white)),
        ),
      ),
    );
  }
}

class CoupleMovieSeat extends StatelessWidget {
  final Color color;
  const CoupleMovieSeat(
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/CoupleSeat.png",
      color: color,
    );
  }
}

class SingleMovieSeat extends StatelessWidget {
  final Color color;
  const SingleMovieSeat(
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/AvailableChair.png",
      color: color,
    );
  }
}

class AllSeats {
  List<Line> seatLines;

  AllSeats(this.seatLines);
}

class Line {
  String lineName;
  String seatTypes;
  List<Seat> seats;

  Line(this.lineName, this.seatTypes, this.seats);
}

abstract class Seat {
  String get lineName;
  String get seatName;
  double get price;
  bool occupied = false;
  bool chosen = false;
}

class SingleSeat extends Seat {
  @override
  // TODO: implement lineName
  String lineName;

  @override
  // TODO: implement price
  String seatName;

  @override
  // TODO: implement seatName
  double price;

  SingleSeat(this.lineName, this.seatName, this.price);
}

class CoupleSeat extends Seat {
  @override
  String lineName;
  @override
  String seatName;
  @override
  double price;

  CoupleSeat(this.lineName, this.seatName, this.price);
}
