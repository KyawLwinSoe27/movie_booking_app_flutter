import 'package:flutter/material.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/movie_details.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../common_widgets/IMDb_widget.dart';
import '../common_widgets/rating_level.dart';
import '../resources/dimensions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
  bool checkNowAndComing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: Icon(Icons.near_me),
        title: Text("Yangon"),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: MARGIN_SMALL_30,
          ),
          Icon(Icons.notifications),
          SizedBox(
            width: MARGIN_SMALL_30,
          ),
          Container(
              padding: EdgeInsets.only(
                right: MARGIN_SMALL_2X,
              ),
              child: Icon(Icons.document_scanner_outlined))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BannerCarouselView(),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: MARGIN_SMALL_20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MARGIN_SMALL_1X),
                          gradient: RadialGradient(colors: [
                            HOME_PAGE_TAB_CENTER_BG,
                            HOME_PAGE_TAB_CORNER_BG
                          ], radius: 5),
                        ),
                        child: DefaultTabController(
                          initialIndex: 0,
                          length: 2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TabBar(
                                  unselectedLabelColor:
                                  LOGIN_SCREEN_SUB_TXT_COLOR,
                                  labelColor:
                                  HOME_PAGE_TABBAR_SELECTED_TEXT_COLOR,
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
                                  tabs: [
                                    Tab(
                                      text: 'Now Showing',
                                    ),
                                    Tab(
                                      text: 'Coming Soon',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 21,
                  crossAxisSpacing: 21,
                  childAspectRatio: 0.63),
              delegate: SliverChildBuilderDelegate((context, index) {
                return !checkNowAndComing
                    ? NowShowingMovieView(index,
                        nowShowingMovies: nowShowingMovies, checkNowAndComing : checkNowAndComing)
                    : ComingSoonMovieView(index,
                        ComingSoonMovies: comingSoonMovies, checkNowAndComing : checkNowAndComing);
              },
                  childCount: !checkNowAndComing
                      ? nowShowingMovies.length
                      : comingSoonMovies.length),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Home',
            backgroundColor: BACKGROUND_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Business',
            backgroundColor: BACKGROUND_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: 'Business',
            backgroundColor: BACKGROUND_COLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_off),
            label: 'School',
            backgroundColor: BACKGROUND_COLOR,
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

class NowShowingMovieView extends StatelessWidget {
  const NowShowingMovieView(
    this.index, {
    Key? key,
    required this.nowShowingMovies,
        required this.checkNowAndComing
  }) : super(key: key);

  final List<String> nowShowingMovies;
  final int index;
  final bool checkNowAndComing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       // router(context, NowShowingMovieDetails());
       //  print(checkNowAndComing);
        router(context, MovieDetails(checkNowAndComing));
      },
      child: Container(
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, BACKGROUND_COLOR])),
            )),
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 7, right: 7),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Venom II",
                        style: TextStyle(
                            fontSize: FONT_SIZE_12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 18,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                                child: Text(
                              "IMDb",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                          SizedBox(
                            width: 0.9,
                          ),
                          Text(
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
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
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
      child: Container(
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, BACKGROUND_COLOR])),
            )),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.5, vertical: 7),
                width: 33,
                height: 30,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: Text("8th AUG",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),textAlign: TextAlign.center,)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 7, right: 7),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Venom II",
                        style: TextStyle(
                            fontSize: FONT_SIZE_12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IMDbWidgetView(),
                          SizedBox(
                            width: 0.9,
                          ),
                          RatingWidgetView("7.1"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
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
        Container(
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
                .map((item) => Container(
                      child: Container(
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(item,
                                    fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  child: Container(
                                    decoration: BoxDecoration(
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
                                    padding: EdgeInsets.only(
                                        top: MARGIN_SMALL_16,
                                        left: MARGIN_SMALL_16 + 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(children: [
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
                                                padding: const EdgeInsets.only(
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
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: "with",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
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
                                                padding: const EdgeInsets.only(
                                                  right: MARGIN_SMALL_1X,
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                                text: "debit card",
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                    padding: EdgeInsets.only(
                                        left: MARGIN_SMALL_16 + 2,
                                        bottom: MARGIN_SMALL_16 - 1),
                                    child: Container(
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
                            )),
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: MARGIN_SMALL_2X,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      position == entry.key
                          ? BoxShadow(
                              color: PRIMARY_COLOR,
                              blurRadius: 5.0,
                              spreadRadius: 2.0)
                          : BoxShadow(),
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
