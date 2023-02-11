import 'package:flick_video_player/flick_video_player.dart';
import 'package:movie_booking_app/common_widgets/rating_level.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../common_widgets/IMDb_widget.dart';
import '../common_widgets/crd_widget.dart';
import '../resources/dimensions.dart';
import 'choose_time_and_cinema.dart';

class NowShowingMovieDetails extends StatefulWidget {
  const NowShowingMovieDetails({Key? key}) : super(key: key);

  @override
  State<NowShowingMovieDetails> createState() => _NowShowingMovieDetailsState();
}

class _NowShowingMovieDetailsState extends State<NowShowingMovieDetails> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "https://mazwai.com/videvo_files/video/free/2014-07/small_watermarked/luke_gibson--my_paddle_preview.webm"),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> moviesChip = [
      "Action",
      "Adventure",
      "Drama",
      "Animation",
      "Action",
      "Adventure",
      "Drama",
      "Animation"
    ];
    List<String> movieViewTypes = [
      "2D",
      "3D",
      "3D IMAX",
      "3D DBOX"
    ];
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSectionView(
                flickManager: flickManager, moviesChip: moviesChip, movieViewTypes: movieViewTypes),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              child: Row(
                children: [
                  CRDWidgetView("Censor Rating", "U/A"),
                  Spacer(),
                  CRDWidgetView("Realease date", "May 8th, 2022"),
                  Spacer(),
                  CRDWidgetView("Duration", "2hr 15min")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: StoryLineWidgetView(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: CastWidgetAndBookingButtonWidgetView(),
            ),
          ],
        ),
      ),
    );
  }
}

class CastWidgetAndBookingButtonWidgetView extends StatelessWidget {
  const CastWidgetAndBookingButtonWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cast",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: MARGIN_SMALL_20,
        ),
        Container(
          height: 100,
          child: Stack(children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 23),
                  child: Column(
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://assets.rebelmouse.io/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vYXNzZXRzLnJibC5tcy8xMDI0OTAwNi9vcmlnaW4uanBnIiwiZXhwaXJlc19hdCI6MTcyNjAxMTg0MX0.X3x_k6E8WUGnrIWC98bMPfq99A3Rlibs0ar7VC7r4f4/img.jpg?width=1200&height=600&coordinates=0%2C106%2C0%2C504",
                            ),
                          )),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        "Katty\nas Monica",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
            ButtonBody(),
            ButtonLeftSideCircle(),
            ButtonRightSideCircle(),
            ButtonText()
          ]),
        ),
      ],
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 65,
        left: 150,
        child: GestureDetector(
            onTap: () {
              router(context, ChooseTimeAndCinema());
            },
            child: Text(
              "Booking",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )));
  }
}

class ButtonRightSideCircle extends StatelessWidget {
  const ButtonRightSideCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 65,
        right: 55,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: BACKGROUND_COLOR,
          ),
        ));
  }
}

class ButtonLeftSideCircle extends StatelessWidget {
  const ButtonLeftSideCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 65,
        left: 55,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: BACKGROUND_COLOR,
          ),
        ));
  }
}

class ButtonBody extends StatelessWidget {
  const ButtonBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 230,
        height: 50,
        decoration: BoxDecoration(
            color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class StoryLineWidgetView extends StatelessWidget {
  const StoryLineWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Story Line",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        SizedBox(
          height: MARGIN_SMALL_3X,
        ),
        Text(
          "In the 1970s, young Gru tries to join a group of supervillains called the Vicious 6 after they oust their leader -- the legendary fighter Wild Knuckles. When the interview turns disastrous, Gru and his Minions go on the run with the Vicious 6 hot on their tails. Luckily, he finds an unlikely source for guidance -- Wild Knuckles himself -- and soon discovers that even bad guys need a little help from their friends.",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        )
      ],
    );
  }
}

class BannerSectionView extends StatelessWidget {
  const BannerSectionView({
    Key? key,
    required this.flickManager,
    required this.moviesChip,
    required this.movieViewTypes,
  }) : super(key: key);

  final FlickManager flickManager;
  final List<String> moviesChip;
  final List<String> movieViewTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 170),
            child: FlickVideoPlayer(
              flickManager: flickManager,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                router(context, HomePage());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Icon(
                Icons.share,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    child: Image.network(
                      "https://todaysparent.mblycdn.com/uploads/tp/2018/04/best-animated-movies-for-kids-coco.jpg",
                      fit: BoxFit.fitHeight,
                      height: 150,
                      width: 130,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Black Widow",
                              style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 7,),
                            IMDbWidgetView(),
                            SizedBox(width: 2,),
                            RatingWidgetView("7.1")
                          ],
                        ),
                        SizedBox(height: 17,),
                        Row(
                          children: movieViewTypes.map((movieViewType) {
                            return Container(margin: EdgeInsets.only(right: MARGIN_SMALL_1X),child: Text(movieViewType+",", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),));
                          }).toList(),
                        ),
                        SizedBox(height: 18,),
                        Wrap(
                          children: moviesChip.map((category) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Chip(
                                label: Text(category),
                              ),
                            );
                          }).toList(),
                        )
                        // Row(
                        //   children: moviesChip.map((category) {
                        //     return Padding(
                        //       padding: EdgeInsets.only(right: 5.0),
                        //       child: Wrap(
                        //         children: [],
                        //       ),
                        //     );
                        //   }).toList(),
                        // )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
