import 'package:flutter/material.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/cinema_details.dart';
import 'package:movie_booking_app/pages/movie_details.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../common_widgets/IMDb_widget.dart';
import '../common_widgets/back_to_widget.dart';
import '../common_widgets/movie_ticket.dart';
import '../common_widgets/rating_level.dart';
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
  List<String> nowShowingMovies = [
    "https://cdn.marvel.com/content/1x/blackwidow_lob_crd_06.jpg",
    "https://dx35vtwkllhj9.cloudfront.net/lionsgateus/plane/images/regions/us/onesheet.jpg",
    "https://m.media-amazon.com/images/M/MV5BNzU4NWEwNDItMzMzYy00ZDYyLWIxZjMtMDlkYWVjNjQwYzBjXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg",
    "https://lumiere-a.akamaihd.net/v1/images/image_b3c7d632.jpeg?region=0,0,743,1100&width=480",
    "https://cdn.marvel.com/content/1x/blackwidow_lob_crd_06.jpg",
    "https://dx35vtwkllhj9.cloudfront.net/lionsgateus/plane/images/regions/us/onesheet.jpg",
    "https://m.media-amazon.com/images/M/MV5BNzU4NWEwNDItMzMzYy00ZDYyLWIxZjMtMDlkYWVjNjQwYzBjXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg",
    "https://lumiere-a.akamaihd.net/v1/images/image_b3c7d632.jpeg?region=0,0,743,1100&width=480",
  ];
  List<String> comingSoonMovies = [
    "https://lumiere-a.akamaihd.net/v1/images/p_luca_21670_3c13c611.jpeg",
    "https://amc-theatres-res.cloudinary.com/image/upload/f_auto,fl_lossy,h_465,q_auto,w_310/v1672403850/amc-cdn/production/2/movies/66200/66246/Poster/Primary_BoxCover_HD_800_1200.jpg",
    "https://flxt.tmsimg.com/assets/p25765_p_v12_aj.jpg",
    "https://akamaividz2.zee5.com/image/upload/w_504,h_756,c_scale,f_webp,q_auto:eco/resources/0-0-1z5266206/portrait/1920x7707e5ac864fad243edba4af6583b84b115.jpg",
    "https://lumiere-a.akamaihd.net/v1/images/p_luca_21670_3c13c611.jpeg",
    "https://amc-theatres-res.cloudinary.com/image/upload/f_auto,fl_lossy,h_465,q_auto,w_310/v1672403850/amc-cdn/production/2/movies/66200/66246/Poster/Primary_BoxCover_HD_800_1200.jpg",
    "https://flxt.tmsimg.com/assets/p25765_p_v12_aj.jpg",
    "https://akamaividz2.zee5.com/image/upload/w_504,h_756,c_scale,f_webp,q_auto:eco/resources/0-0-1z5266206/portrait/1920x7707e5ac864fad243edba4af6583b84b115.jpg",
  ];
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
          ? movies(context)
          : _currentPage == 1
              ? CinemaLists(cinemas : cinemas)
              : _currentPage == 2
                  ? const TicketWidget()
                  : _currentPage == 3
                      ? ProfileWidget()
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

  Container movies(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const BannerCarouselView(),
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
                      nowShowingMovies: nowShowingMovies,
                      checkNowAndComing: checkNowAndComing)
                  : ComingSoonMovieView(index,
                      ComingSoonMovies: comingSoonMovies,
                      checkNowAndComing: checkNowAndComing);
            },
                childCount: !checkNowAndComing
                    ? nowShowingMovies.length
                    : comingSoonMovies.length),
          ),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    Key? key,
  }) : super(key: key);

  final profileTabs = [
    ProfileTabList(Icons.history, "Purchae History"),
    ProfileTabList(Icons.local_offer, "Offer"),
    ProfileTabList(Icons.card_giftcard, "Gift Card"),
    ProfileTabList(Icons.location_on_rounded, "Location"),
    ProfileTabList(Icons.payment, "Payment"),
    ProfileTabList(Icons.help, "Help and Support"),
    ProfileTabList(Icons.logout, "Logout")
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 414,
                height: 300,
                child: Image.asset("images/profilebg.png",fit: BoxFit.cover,),
              ),
              const Positioned(
                top: 80,
                left: 150,
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: PRIMARY_COLOR,
                ),
              ),
              Positioned(
                bottom: 40,
                left: 90,
                child: Container(
                  decoration: BoxDecoration(
                    color: HOME_PAGE_PROFILE_BUTTON_COLOR,
                    borderRadius: BorderRadius.circular(MARGIN_SMALL_8),
                    border: Border.all(color: PRIMARY_COLOR),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MARGIN_SMALL_2X,
                      horizontal: MARGIN_MEDIUM_1X,
                    ),
                    child: Text(
                      "Login or Signup Up",
                      style: TextStyle(
                          fontSize: TITLE_TEXT_FONT_SIZE,
                          fontWeight: FontWeight.w600,
                          color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 700,
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_SMALL_20,
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: MARGIN_SMALL_2X,),
                  child: Row(
                    children: [
                      Icon(profileTabs[index].icon,color: Colors.white,),
                      const SizedBox(width: MARGIN_SMALL_2X,),
                      Text(
                        profileTabs[index].text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: TITLE_TEXT_FONT_SIZE),
                      ),
                      const Spacer(),
                      const Icon(Icons.chevron_right,color: Colors.white,)
                    ],
                  ),
                );
              },
              itemCount: profileTabs.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR);
              },
            ),
          )
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

  final List<String> nowShowingMovies;
  final int index;
  final bool checkNowAndComing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        router(context, MovieDetails(checkNowAndComing));
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              nowShowingMovies[index],
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
                    const Text(
                      "Venom II",
                      style: TextStyle(
                          fontSize: FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Spacer(),
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
    );
  }
}

class ComingSoonMovieView extends StatelessWidget {
  const ComingSoonMovieView(
    this.index, {
    Key? key,
    required this.ComingSoonMovies,
    required this.checkNowAndComing,
  }) : super(key: key);

  final List<String> ComingSoonMovies;
  final int index;
  final bool checkNowAndComing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(checkNowAndComing);
        router(context, MovieDetails(checkNowAndComing));
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              ComingSoonMovies[index],
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
                    const Text(
                      "Venom II",
                      style: TextStyle(
                          fontSize: FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Spacer(),
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
    );
  }
}

class BannerCarouselView extends StatefulWidget {
  const BannerCarouselView({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerCarouselView> createState() => _BannerCarouselViewState();
}

class _BannerCarouselViewState extends State<BannerCarouselView> {
  double position = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://www.poultryworld.net/app/uploads/2021/04/001_310_IMG_KFCed.jpg',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 370,
          height: 170,
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (page, carouselReason) {
                setState(() {
                  position = page.toDouble();
                });
              },
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(BORDER_RADIUS_5)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item,
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 0, 1, 1.0),
                                  Colors.transparent,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: MARGIN_SMALL_16,
                                left: MARGIN_SMALL_20),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(children: [
                                    TextSpan(
                                      text: "10%",
                                      style: TextStyle(
                                        fontSize:
                                            HOME_PAGE_BANNER_DISCOUNT_PERCENT,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: MARGIN_SMALL_1X,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "off",
                                      style: TextStyle(
                                          fontSize:
                                              TITLE_TEXT_FONT_SIZE,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.3),
                                    ),
                                  ]),
                                ),
                                RichText(
                                  text: const TextSpan(children: [
                                    TextSpan(
                                      text: "with",
                                      style: TextStyle(
                                        fontSize: FONT_SIZE_14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: MARGIN_SMALL_1X,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "KBZ",
                                        style: TextStyle(
                                          fontSize:
                                              TITLE_TEXT_FONT_SIZE,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: MARGIN_SMALL_1X,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "debit card",
                                        style: TextStyle(
                                          fontSize: FONT_SIZE_14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: MARGIN_SMALL_20,
                                bottom: MARGIN_SMALL_16),
                            child: SizedBox(
                              width: 93,
                              height: 62,
                              child: Image.asset(
                                "images/Credit_Card.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    )))
                .toList(),
          ),
        ),
        const SizedBox(
          height: MARGIN_SMALL_2X,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                  width: MARGIN_SMALL_8,
                  height: MARGIN_SMALL_8,
                  margin: const EdgeInsets.symmetric(vertical: MARGIN_SMALL_8, horizontal: MARGIN_SMALL_1X),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      position == entry.key
                          ? const BoxShadow(
                              color: PRIMARY_COLOR,
                              blurRadius: 5.0,
                              spreadRadius: 2.0)
                          : const BoxShadow(),
                    ],
                    color: position == entry.key
                        ? PRIMARY_COLOR
                        : HOME_PAGE_INACTIVE_DOTS_COLOR,
                  )),
            );
          }).toList(),
        ),
      ],
    );
  }
}
