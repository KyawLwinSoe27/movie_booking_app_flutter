import 'package:flutter/material.dart';
import 'package:movie_booking_app/common_widgets/back_to_widget.dart';
import 'package:movie_booking_app/data/vos/movies_vo.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../resources/dimensions.dart';
import 'home_page.dart';

class MovieSearch extends StatefulWidget {
  final checkNowAndComing;
  final List<MoviesVO>? nowShowingMovies;
  final  List<MoviesVO>? comingSoonMovies;
  const MovieSearch(
      {Key? key,
      required this.checkNowAndComing,
      required this.nowShowingMovies,
      required this.comingSoonMovies})
      : super(key: key);

  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  // Initial Selected Value
  String genrevalue = 'genres';
  String formatvalue = 'format';
  String monthvalue = 'month';

  // List of items in our dropdown menu
  List<String> genres = [
    'genres',
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

  List<String> months = [
    'month',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

   String searchText = "";

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }
  @override
  void initState() {
    // TODO: implement initState
    print(searchText);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Container(
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
                          searchText = value;
                        });
                        print(searchText);
                      },
                      // controller: myController,
                      cursorColor: PRIMARY_COLOR,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Search the movie',
                        hintStyle: TextStyle(
                          color: TICKET_BG_TOP_COLOR,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
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
                          hint: Text("Genres"),

                          // Initial Value
                          value: genrevalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: genres.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              genrevalue = newValue!;
                            });
                          },
                          underline: Container(),
                        ),
                      ),
                    ),
                    SizedBox(width: MARGIN_SMALL_2X,),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(BORDER_RADIUS_2X,),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
                        child: DropdownButton(
                          hint: Text("Format"),
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
                    SizedBox(width: MARGIN_SMALL_2X,),
                    Visibility(
                      visible: widget.checkNowAndComing,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(BORDER_RADIUS_2X,),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
                          child: DropdownButton(
                            items: months.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            hint: Text("Month"),
                            // Initial Value
                            value:monthvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items

                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (newValue) {
                              setState(() {
                                monthvalue = newValue!;
                              });
                            },
                            underline: Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MARGIN_SMALL_2X,),
              searchText.isNotEmpty ? Container(
                height: 400,
                color: BACKGROUND_COLOR,
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: MARGIN_SMALL_20,
                          crossAxisSpacing: MARGIN_SMALL_20,
                          childAspectRatio: 0.63),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return !widget.checkNowAndComing
                            ? NowShowingMovieView(0,
                            nowShowingMovies: widget.nowShowingMovies ?? [],
                            checkNowAndComing: widget.checkNowAndComing)
                            : ComingSoonMovieView(0,
                            comingSoonMovies: widget.comingSoonMovies ?? [],
                            checkNowAndComing: widget.checkNowAndComing);
                      },
                          childCount: 1),
                    ),
                  ],
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
