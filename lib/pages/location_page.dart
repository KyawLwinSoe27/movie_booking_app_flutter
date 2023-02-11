import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import '../functions/reuse_functions.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../resources/dimensions.dart';

class LocationPage extends StatefulWidget {
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<String> cities = [
    "Yangon",
    "Mandalay",
    "Naypyidaw",
    "Bago",
    "Mawlwmyine",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2X),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: TitleWidget(),
            ),
            SizedBox(
              height: MARGIN_SMALL_4X,
            ),
            SearchLocationAndButton(),
            SizedBox(
              height: MARGIN_SMALL_30,
            ),
            ImageWidget(),
            CitiesTitleWidget(),
            Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if(cities[index] == "Yangon"){
                        router(context,HomePage());
                      }
                    },
                    child: Container(
                      height: MARGIN_MEDIUM_3X,
                      padding: EdgeInsets.only(
                        left: MARGIN_SMALL_3X,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.symmetric(horizontal: BorderSide(color: REGION_PAGE_CITIES_BG)),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${cities[index]}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CitiesTitleWidget extends StatelessWidget {
  const CitiesTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: REGION_PAGE_CITIES_BG,
      height: 40,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: MARGIN_SMALL_3X,
      ),
      child: Text(
        "Cities",
        style: TextStyle(
          color: Colors.white,
          fontSize: CITIES_FONT_SIZE,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 91,
        height: 51,
        child: Image.asset(
          "images/buildings.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pick Region",
      style: TextStyle(
        color: PRIMARY_COLOR,
        fontSize: TITLE_TEXT_FONT_SIZE,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class SearchLocationAndButton extends StatelessWidget {
  const SearchLocationAndButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_SMALL_3X,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 276,
            height: 50,
            decoration: BoxDecoration(
              gradient: TEXT_INPUT_GRADIENT_COLOR,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search your location",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(158, 158, 158, 1.0),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: PRIMARY_COLOR,
                    size: LOGIN_SCREEN_MAIN_TEXT_SIZE,
                  )),
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL_2X + MARGIN_SMALL_2X,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.near_me),
          )
        ],
      ),
    );
  }
}
