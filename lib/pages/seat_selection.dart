import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/choose_time_and_cinema.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../common_widgets/back_to_widget.dart';
import '../common_widgets/booking_button.dart';
import '../resources/dimensions.dart';
import 'food_order_page.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({Key? key}) : super(key: key);

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  final cinema = AllSeats([
    Line("A", "normal", [
      SingleSeat("A", "1", 4500),
      SingleSeat("A", "2", 4500),
      SingleSeat("A", "3", 4500),
      SingleSeat("A", "4", 4500),
      SingleSeat("A", "5", 4500),
      SingleSeat("A", "6", 4500),
      SingleSeat("A", "7", 4500),
      SingleSeat("A", "8", 4500),
    ]),
    Line("B", "normal", [
      SingleSeat("B", "1", 4500),
      SingleSeat("B", "2", 4500),
      SingleSeat("B", "3", 4500),
      SingleSeat("B", "4", 4500),
      SingleSeat("B", "5", 4500),
      SingleSeat("B", "6", 4500),
      SingleSeat("B", "7", 4500),
      SingleSeat("B", "8", 4500),
    ]),
    Line("C", "executive", [
      SingleSeat("C", "1", 6500),
      SingleSeat("C", "2", 6500),
      SingleSeat("C", "3", 6500),
      SingleSeat("C", "4", 6500),
      SingleSeat("C", "5", 6500),
      SingleSeat("C", "6", 6500),
      SingleSeat("C", "7", 6500),
      SingleSeat("C", "8", 6500),
    ]),
    Line("D", "executive", [
      SingleSeat("A", "1", 6500),
      SingleSeat("D", "2", 6500),
      SingleSeat("D", "3", 6500),
      SingleSeat("D", "4", 6500),
      SingleSeat("D", "5", 6500),
      SingleSeat("D", "6", 6500),
      SingleSeat("D", "7", 6500),
      SingleSeat("D", "8", 6500),
    ]),
    Line("E", "premium", [
      SingleSeat("E", "1", 8500),
      SingleSeat("E", "2", 8500),
      SingleSeat("E", "3", 8500),
      SingleSeat("E", "4", 8500),
      SingleSeat("E", "5", 8500),
      SingleSeat("E", "6", 8500),
      SingleSeat("E", "7", 8500),
      SingleSeat("E", "8", 8500),
    ]),
    Line("F", "premium", [
      SingleSeat("F", "1", 8500),
      SingleSeat("F", "2", 8500),
      SingleSeat("F", "3", 8500),
      SingleSeat("F", "4", 8500),
      SingleSeat("F", "5", 8500),
      SingleSeat("F", "6", 8500),
      SingleSeat("F", "7", 8500),
      SingleSeat("F", "8", 8500),
    ]),
    Line("G", "gold", [
      CoupleSeat("G", "1", 10000),
      SingleSeat("G", "2", 10000),
      SingleSeat("G", "3", 10000),
      SingleSeat("G", "4", 10000),
      SingleSeat("G", "5", 10000),
      SingleSeat("G", "6", 10000),
      CoupleSeat("G", "7", 10000)
    ]),
    Line("H", "gold", [
      CoupleSeat("H", "1", 10000),
      SingleSeat("H", "2", 10000),
      SingleSeat("H", "3", 10000),
      SingleSeat("H", "4", 10000),
      SingleSeat("H", "5", 10000),
      SingleSeat("H", "6", 10000),
      CoupleSeat("H", "7", 10000)
    ]),
  ]);

  List<Seat> userTaken = [];

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
  Widget build(BuildContext context) {
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
                    height: 800,
                    child: Column(
                      children: [
                        SeatTypeAndPrice("Normal(4500Ks)"),
                        SizedBox(height: 20,),
                        ...cinema.seatLines
                            .where((seatType) => seatType.seatTypes == "normal")
                            .map((line) => LineWidget(
                          line: line,
                          onTaken: _chosen,
                          spaceAfter: const [4],
                        )),
                        SizedBox(height: 20,),
                        SeatTypeAndPrice("Executive(6500Ks)"),
                        SizedBox(height: 20,),
                        ...cinema.seatLines
                            .where((seatType) => seatType.seatTypes == "executive")
                            .map((line) => LineWidget(line: line, onTaken: _chosen,spaceAfter: const [4],),),
                        SizedBox(height: 20,),
                        SeatTypeAndPrice("Premium(8500Ks)"),
                        SizedBox(height: 20,),
                        ...cinema.seatLines.where((seatType) => seatType.seatTypes == "premium").map((line) => LineWidget(line: line, onTaken: _chosen,spaceAfter: [4],),),
                        SizedBox(height: 20,),
                        SeatTypeAndPrice("Gold(10000Ks)"),
                        SizedBox(height: 20,),
                        ...cinema.seatLines.where((seatType) => seatType.seatTypes == "gold").map((line) => LineWidget(line: line, onTaken: _chosen,spaceAfter: [1,7],),),
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
                    SizedBox(height: MARGIN_SMALL_20,),
                    ZoomWidget(),
                    SizedBox(height: MARGIN_SMALL_20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${userTaken.length} Ticket${userTaken.length > 1 ? "s" : ""} ',
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
                                "${getTotalAmount()}K${getTotalAmount() > 1 ? 's' : ''}",
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
                    SizedBox(height: MARGIN_SMALL_20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
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
        Icon(Icons.add,color: Colors.white,),
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
        Icon(Icons.remove,color: Colors.white,)
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

class LineWidget extends StatefulWidget {
  const LineWidget({
    super.key,
    required this.line,
    required this.onTaken,
    this.spaceAfter,
  });

  final Line line;
  final Function(Seat takenSeat) onTaken;
  final List<int>? spaceAfter;

  @override
  State<LineWidget> createState() => _LineWidgetState();
}

class _LineWidgetState extends State<LineWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> formatSeat = [
      ...widget.line.seats.map((e) => SeatWidget(
            seat: e,
            onSelected: widget.onTaken,
          ))
    ];

    for (var index in widget.spaceAfter!) {
      formatSeat.insert(index, const Expanded(child: SizedBox()));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            widget.line.lineName,
            style: TextStyle(color: TICKET_BG_TOP_COLOR),
          ),
          const SizedBox(width: 5),
          Expanded(child: Row(children: formatSeat)),
          const SizedBox(width: 5),
          Text(
            widget.line.lineName,
            style: TextStyle(color: TICKET_BG_TOP_COLOR),
          ),
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
          if(!widget.seat.occupied) {
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
              ? ( widget.seat.chosen
              ? SingleMovieSeat(PRIMARY_COLOR)
              : widget.seat.occupied
              ? SingleMovieSeat(Colors.black12)
              : SingleMovieSeat(Colors.white) )
              :( widget.seat.chosen
              ? CoupleMovieSeat(PRIMARY_COLOR)
              : widget.seat.occupied
              ? CoupleMovieSeat(Colors.black12)
              : CoupleMovieSeat(Colors.white) ),
        ),
      ),
    );
  }
}

class CoupleMovieSeat extends StatelessWidget {
  final Color color;
  const CoupleMovieSeat(this.color,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/CoupleSeat.png",color: color,);
  }
}

class SingleMovieSeat extends StatelessWidget {
  final Color color;
  const SingleMovieSeat(this.color,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/AvailableChair.png",color: color,);
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
