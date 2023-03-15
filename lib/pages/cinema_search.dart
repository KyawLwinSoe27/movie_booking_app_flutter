import 'package:flutter/material.dart';
import 'package:movie_booking_app/common_widgets/back_to_widget.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../functions/reuse_functions.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';
import 'cinema_details.dart';
import 'cinema_list.dart';
import 'home_page.dart';

class CinemaSearch extends StatefulWidget {
  final List<Cinema> cinemas;
  const CinemaSearch(this.cinemas,
      {Key? key})
      : super(key: key);

  @override
  State<CinemaSearch> createState() => _CinemaSearchState();
}

class _CinemaSearchState extends State<CinemaSearch> {
  // Initial Selected Value
  String facilityvalue = 'Facilities';
  String formatvalue = 'format';

  // List of items in our dropdown menu
  List<String> facilities = [
    'Facilities',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> formats = [
    'format',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String searchCinema = "";

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_SMALL_2X,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackToWidget(),
                    const SizedBox(
                      width: MARGIN_SMALL_2X,
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: HOME_PAGE_BANNER_DISCOUNT_PERCENT,
                    ),
                    const SizedBox(
                      width: MARGIN_SMALL_2X,
                    ),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (value) {
                          setState(() {
                            searchCinema = value;
                          });
                          // print(searchCinema);
                        },
                        // controller: myController,
                        cursorColor: PRIMARY_COLOR,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Search the movie',
                          hintStyle: TextStyle(
                            color: TICKET_BG_TOP_COLOR,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: MARGIN_SMALL_2X,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.filter_alt,
                        color: PRIMARY_COLOR,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(BORDER_RADIUS_2X,),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
                          child: DropdownButton(

                            // Initial Value
                            value: facilityvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: facilities.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                facilityvalue = newValue!;
                              });
                            },
                            underline: Container(),
                          ),
                        ),
                      ),
                      const SizedBox(width: MARGIN_SMALL_2X,),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(BORDER_RADIUS_2X,),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
                          child: DropdownButton(
                            hint: const Text("Format"),
                            // Initial Value
                            value: formatvalue ,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: formats.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                formatvalue = newValue!;
                              });
                            },
                            underline: Container(),
                          ),
                        ),
                      ),
                      const SizedBox(width: MARGIN_SMALL_2X,),
                    ],
                  ),
                ),
                Container(
                  color: BACKGROUND_COLOR,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: MARGIN_SMALL_30,),
                      PriceRangeWidget(),
                      ShowTimesWidget()
                    ],
                  ),
                ),
                searchCinema.isNotEmpty ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    color: BACKGROUND_COLOR,
                    height: 500,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: MARGIN_SMALL_16,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.cinemas[index].CinemaName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MARGIN_SMALL_16,
                                        color: Colors.white),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      router(context, const CinemaDetails());
                                    },
                                    child:const Text(
                                      CINEMA_DETAILS,
                                      style: TextStyle(
                                          color: PRIMARY_COLOR,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: MARGIN_SMALL_2X,
                              ),
                              Row(
                                children: const [
                                  CinemaServiceWidgets(
                                      Icons.local_parking_outlined, CINEMA_SERVICE_PARKING),
                                  SizedBox(
                                    width: MARGIN_SMALL_1X,
                                  ),
                                  CinemaServiceWidgets(Icons.fastfood, CINEMA_SERVICE_FOOD),
                                  SizedBox(
                                    width: MARGIN_SMALL_1X,
                                  ),
                                  CinemaServiceWidgets(
                                      Icons.wheelchair_pickup, CINEMA_SERVICE_WHEEL_CHAIR),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 2,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
                        );
                      },
                    ),
                  ),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
