import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/cinema_details.dart';
import 'package:movie_booking_app/pages/movie_details.dart';
import 'package:movie_booking_app/pages/profile_page.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../common_widgets/IMDb_widget.dart';
import '../common_widgets/back_to_widget.dart';
import '../common_widgets/movie_ticket.dart';
import '../common_widgets/rating_level.dart';
import '../data/vos/banner_vo.dart';
import '../data/vos/movies_vo.dart';
import '../network/api_constant.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';
import 'cancel_booking.dart';
import './cinema_list.dart';
import './profile_tab_list.dart';
import './movie_search.dart';
import 'cinema_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {

  MovieBookingModel movieBookingModel = MovieBookingModelImpl();

  List<Cinema> cinemas = [
    Cinema("JCGV Junction City"),
    Cinema("JCGV City Mall"),
    Cinema("Mingalar Cinema Gold Class"),
    Cinema("Thamada Cinema"),
    Cinema("Shae Saung Cinema"),
    Cinema("Nawaday Cinema"),
    Cinema("Thamada Cinema"),
    Cinema("Shae Saung Cinema"),
    Cinema("Nawaday Cinema")
  ];


  bool checkNowAndComing = false;
  int _currentPage = 0;
  //State Variable
  List<BannerVO>? banner;
  List<MoviesVO>? nowShowingMovies;
  List<MoviesVO>? comingSoonMovies;

  @override
  void initState() {
    movieBookingModel.getBanner().then((bannerList) {
      setState(() {
        banner = bannerList;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieBookingModel.getMovies("current").then((movies) {
      setState(() {
        nowShowingMovies = movies;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieBookingModel.getMovies("comingsoon").then((movies) {
      setState(() {
        comingSoonMovies = movies;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: _currentPage != 3
          ? AppBar(
              elevation: ELEVATION,
              backgroundColor: BACKGROUND_COLOR,
              leading: _currentPage == 0 ? const Icon(Icons.near_me) : null,
              title: _currentPage == 0 ? const Text("Yangon") : null,
              actions: _currentPage != 3
                  ? [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          router(context, _currentPage == 0 ? MovieSearch(checkNowAndComing:checkNowAndComing, nowShowingMovies: nowShowingMovies,comingSoonMovies: comingSoonMovies,) :  CinemaSearch(cinemas) );
                        },
                      ),
                      const SizedBox(
                        width: MARGIN_SMALL_30,
                      ),
                      const Icon(Icons.notifications),
                      const SizedBox(
                        width: MARGIN_SMALL_30,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                            right: MARGIN_SMALL_2X,
                          ),
                          child: const Icon(Icons.document_scanner_outlined))
                    ]
                  : null,
            )
          : null,
      body: _currentPage == 0
          ? Movies(banner : banner, comingSoonMovies : comingSoonMovies, nowShowingMovies : nowShowingMovies)
          : _currentPage == 1
              ? CinemaLists(cinemas : cinemas)
              : _currentPage == 2
                  ? const TicketWidget()
                  : _currentPage == 3
                      ? const ProfileWidget()
                      : null,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: LOGIN_SCREEN_SUB_TXT_COLOR,
        selectedItemColor: PRIMARY_COLOR,
        type: BottomNavigationBarType.fixed,
        backgroundColor: BACKGROUND_COLOR,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_sharp),
            label: BOTTOMNAVIGATION_INDEX_1,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters),
            label: BOTTOMNAVIGATION_INDEX_2,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: BOTTOMNAVIGATION_INDEX_3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: BOTTOMNAVIGATION_INDEX_4,
          ),
        ],
      ),
    );
  }
}
class Movies extends StatefulWidget {
  final List<BannerVO>? banner;
  final  List<MoviesVO>? comingSoonMovies;
  final List<MoviesVO>? nowShowingMovies;
  const Movies({Key? key,
    required this.banner,
    required this.comingSoonMovies,
    required this.nowShowingMovies,
  }) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  bool checkNowAndComing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                widget.banner != null ? BannerCarouselView(banner : widget.banner ) :const Center(child: CircularProgressIndicator()),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: MARGIN_SMALL_20,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MARGIN_SMALL_1X),
                        gradient: const RadialGradient(colors: [
                          HOME_PAGE_TAB_CENTER_BG,
                          HOME_PAGE_TAB_CORNER_BG
                        ], radius: BORDER_RADIUS_2X),
                      ),
                      child: DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        //need to change
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TabBar(
                            unselectedLabelColor: LOGIN_SCREEN_SUB_TXT_COLOR,
                            labelColor: HOME_PAGE_TABBAR_SELECTED_TEXT_COLOR,
                            indicator: BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onTap: (index) {
                              if (index == 1) {
                                setState(() {
                                  checkNowAndComing = true;
                                });
                              } else if (index == 0) {
                                setState(() {
                                  checkNowAndComing = false;
                                });
                              }
                            },
                            tabs: const [
                              Tab(
                                text: NOWSHOWING_TAB,
                              ),
                              Tab(
                                text: COMINGSOON_TAB,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: MARGIN_SMALL_20,
                crossAxisSpacing: MARGIN_SMALL_20,
                childAspectRatio: 0.63),
            delegate: SliverChildBuilderDelegate((context, index) {
              return !checkNowAndComing
                  ? NowShowingMovieView(index,
                  nowShowingMovies: widget.nowShowingMovies ?? [],
                  checkNowAndComing: checkNowAndComing)
                  : ComingSoonMovieView(index,
                  comingSoonMovies: widget.comingSoonMovies ?? [],
                  checkNowAndComing: checkNowAndComing);
            },
                childCount: !checkNowAndComing
                    ? widget.nowShowingMovies?.length ?? 0
                    : widget.comingSoonMovies?.length ?? 0),
          ),
        ],
      ),
    );
  }
}

class CinemaLists extends StatelessWidget {
  const CinemaLists({
    Key? key,
    required this.cinemas
  }) : super(key: key);

  final List<Cinema> cinemas;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: MARGIN_SMALL_3X,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(
                  bottom: MARGIN_SMALL_2X,
                ),
                child: const Text(
                  CINEMAS,
                  style: TextStyle(
                      fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
            SizedBox(
              height: 650,
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
                              cinemas[index].CinemaName,
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
                              child: const Text(
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
                itemCount: cinemas.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
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
    return Row(
      children: [
        Container(
          width: CINEMA_SERVICE_WIDTH_HEIGHT,
          height: CINEMA_SERVICE_WIDTH_HEIGHT,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR, width: 2),
          ),
          child: Icon(
            serviceIcon,
            size: FONT_SIZE_10,
            color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
          ),
        ),
        const SizedBox(
          width: MARGIN_SMALL_1X,
        ),
        Text(
          serviceTitle,
          style: const TextStyle(
              color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR,
              fontSize: FONT_SIZE_14,
              fontWeight: FontWeight.w500),
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
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      router(context, const CancelBooking());
                    },
                    child: const ReceiptWidget());
              }),
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  final String text;
  const FilterWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 27,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8,),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_2X),
        child: Row(
          children: [
            Text(text),
            const Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
      ),
    );
  }
}
class ShowTimesWidget extends StatefulWidget {
  const ShowTimesWidget({Key? key}) : super(key: key);

  @override
  State<ShowTimesWidget> createState() => _ShowTimesWidgetState();
}

class _ShowTimesWidgetState extends State<ShowTimesWidget> {
  RangeValues _currentRangeValues = const RangeValues(8, 12);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(SHOW_TIMES,style: TextStyle(fontSize: FONT_SIZE_14,fontWeight: FontWeight.w600,color: Colors.white),),
        const SizedBox(height: MARGIN_SMALL_20,),
        Row(
          children: const [
            RangeLabelWidget("8am"),
            Spacer(),
            RangeLabelWidget("12pm"),
          ],
        ),
        const SizedBox(height: MARGIN_SMALL_1X,),
        RangeSlider(
          activeColor: PRIMARY_COLOR,
          values: _currentRangeValues,
          max: 50000.0,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
            print(values);
          },
        )
      ],
    );
  }
}


class PriceRangeWidget extends StatefulWidget {
  const PriceRangeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PriceRangeWidget> createState() => _PriceRangeWidgetState();
}

class _PriceRangeWidgetState extends State<PriceRangeWidget> {
  RangeValues _currentRangeValues = const RangeValues(3500, 30000);
  @override
  Widget build(BuildContext context) {
    // RangeLabels labels = RangeLabels(values.start.toString(),values.end.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(PRICERANGE,style: TextStyle(fontSize: FONT_SIZE_14,fontWeight: FontWeight.w600,color: Colors.white),),
        const SizedBox(height: MARGIN_SMALL_20,),
        Row(
          children: const [
            RangeLabelWidget("3500Ks"),
            Spacer(),
            RangeLabelWidget("29500Ks"),
          ],
        ),
        const SizedBox(height: MARGIN_SMALL_1X,),
        RangeSlider(
          activeColor: PRIMARY_COLOR,
          values: _currentRangeValues,
          max: 50000.0,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
            print(values);
          },
        )
      ],
    );
  }
}

class RangeLabelWidget extends StatelessWidget {
  final String text;
  const RangeLabelWidget(this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: FONT_SIZE_14,color: LOGIN_SCREEN_SUB_TXT_COLOR),);
  }
}

class NowShowingMovieView extends StatelessWidget {
  const NowShowingMovieView(this.index,
      {Key? key,
      required this.nowShowingMovies,
      required this.checkNowAndComing})
      : super(key: key);

  final List<MoviesVO>? nowShowingMovies;
  final int index;
  final bool checkNowAndComing;

  @override
  Widget build(BuildContext context) {
    return nowShowingMovies != null ? GestureDetector(
      onTap: () {
        router(context, MovieDetails(checkNowAndComing,movieId: nowShowingMovies?[index].id ?? 0,));
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "$IMAGE_BASE_URL${nowShowingMovies?[index].posterPath ?? ""}",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, BACKGROUND_COLOR])),
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 7, right: 7),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        nowShowingMovies?[index].originalTitle ?? "",
                        style: const TextStyle(
                            fontSize: FONT_SIZE_12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: MARGIN_SMALL_2X,),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 18,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(BORDER_RADIUS_3)),
                          child: const Center(
                              child: Text(
                                "IMDb",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: FONT_SIZE_12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ),
                        const SizedBox(
                          width: 1.0,
                        ),
                        const Text(
                          "9.0",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: const [
                    Text(
                      "9.0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "2D,3D,3D IMAX",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ) :const Center(child: CircularProgressIndicator());
  }
}

class ComingSoonMovieView extends StatelessWidget {
  const ComingSoonMovieView(
    this.index, {
    Key? key,
    required this.comingSoonMovies,
    required this.checkNowAndComing,
  }) : super(key: key);

  final List<MoviesVO>? comingSoonMovies;
  final int index;
  final bool checkNowAndComing;

  @override
  Widget build(BuildContext context) {
    return comingSoonMovies != null ? GestureDetector(
      onTap: () {
        print(checkNowAndComing);
        router(context, MovieDetails(checkNowAndComing, movieId: comingSoonMovies?[index].id ?? 0,));
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "$IMAGE_BASE_URL${comingSoonMovies?[index].posterPath ?? ""}",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, BACKGROUND_COLOR])),
          )),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_8, vertical: MARGIN_SMALL_8),
              width: 33,
              height: 30,
              decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(BORDER_RADIUS_2X)),
              child: const Center(
                  child: Text(
                "8th AUG",
                style: TextStyle(fontSize: FONT_SIZE_10, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: MARGIN_SMALL_20, left: MARGIN_SMALL_8, right: MARGIN_SMALL_8),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        comingSoonMovies?[index].originalTitle ?? "",
                        style: const TextStyle(
                            fontSize: FONT_SIZE_12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: MARGIN_SMALL_2X,),
                    Row(
                      children: const [
                        IMDbWidgetView(),
                        SizedBox(
                          width: 1.0,
                        ),
                        RatingWidgetView("7.1"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: MARGIN_SMALL_2X,
                ),
                Row(
                  children: const [
                    Text(
                      "9.0",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: FONT_SIZE_12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: MARGIN_SMALL_8,
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: FONT_SIZE_12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: MARGIN_SMALL_2X,
                    ),
                    Text(
                      "2D,3D,3D IMAX",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ) : const Center(child: CircularProgressIndicator());
  }
}

class BannerCarouselView extends StatefulWidget {
  final List<BannerVO>? banner;
  const BannerCarouselView({
    Key? key, required this.banner,
  }) : super(key: key);

  @override
  State<BannerCarouselView> createState() => _BannerCarouselViewState();
}

class _BannerCarouselViewState extends State<BannerCarouselView> {
  double position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 370,
          height: 150,
          child: BannerCarouselView(banner: widget.banner),
        ),
        const SizedBox(
          height: MARGIN_SMALL_2X,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: widget.banner?.asMap().entries.map((entry) {
        //     return GestureDetector(
        //       onTap: () => _controller.animateToPage(entry.key),
        //       child: Container(
        //           width: MARGIN_SMALL_8,
        //           height: MARGIN_SMALL_8,
        //           margin: const EdgeInsets.symmetric(vertical: MARGIN_SMALL_8, horizontal: MARGIN_SMALL_1X),
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             boxShadow: [
        //               position == entry.key
        //                   ? const BoxShadow(
        //                       color: PRIMARY_COLOR,
        //                       blurRadius: 5.0,
        //                       spreadRadius: 2.0)
        //                   : const BoxShadow(),
        //             ],
        //             color: position == entry.key
        //                 ? PRIMARY_COLOR
        //                 : HOME_PAGE_INACTIVE_DOTS_COLOR,
        //           )),
        //     );
        //   }).toList() ?? [],
        // ),
      ],
    );
  }
}
