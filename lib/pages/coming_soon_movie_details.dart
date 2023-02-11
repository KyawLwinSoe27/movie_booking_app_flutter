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

class ComingSoonMovieDetails extends StatefulWidget {
  const ComingSoonMovieDetails({Key? key}) : super(key: key);

  @override
  State<ComingSoonMovieDetails> createState() => _ComingSoonMovieDetailsState();
}

class _ComingSoonMovieDetailsState extends State<ComingSoonMovieDetails> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "https://mazwai.com/videvo_files/video/free/2014-06/small_watermarked/dylan_hahn--high_rock_colors_preview.webm"),
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
      "Comedy",
      "Animation",
    ];
    List<String> movieViewTypes = [
      "2D",
    ];
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSectionView(
                flickManager: flickManager,
                moviesChip: moviesChip,
                movieViewTypes: movieViewTypes),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              child: Row(
                children: [
                  CRDWidgetView("Censor Rating", "U"),
                  Spacer(),
                  CRDWidgetView("Realease date", "AUG 8th, 2022"),
                  Spacer(),
                  CRDWidgetView("Duration", "2hr 15min")
                ],
              ),
            ),
            NotiReleaseWidgetView(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: StoryLineWidgetView(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: CastWidgetView(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotiReleaseWidgetView extends StatelessWidget {
  const NotiReleaseWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17,right: 17,bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(255, 255, 255, 0.6),
            Color.fromRGBO(204, 204, 204, 0.6),
            Color.fromRGBO(221, 221, 221, 0.3)
          ]
        )
      ),
      child: Row(
        children: [
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Releasing in 5 days", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
                    SizedBox(height: MARGIN_SMALL_2X,),
                    Text("Get notify as soon as movie booking opens up in your city!",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Color.fromRGBO(200, 200, 200, 1),),),
                    SizedBox(height: MARGIN_SMALL_20,),
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.notifications_active),
                            SizedBox(width: 12,),
                            Text("Set Notification", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 17,),
          Container(
            width: 110,
            height: 127,

            child: Image.asset("images/human_illustrate.png",fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}

class CastWidgetView extends StatelessWidget {
  const CastWidgetView({
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
          child: ListView.builder(
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
          Container(
            margin: EdgeInsets.only(top: 180),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    child: Image.network(
                      "https://dx35vtwkllhj9.cloudfront.net/universalstudios/minions-the-rise-of-gru/images/regions/us/onesheet.jpg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Minions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              IMDbWidgetView(),
                              SizedBox(
                                width: 2,
                              ),
                              RatingWidgetView("9.0")
                            ],
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            children: movieViewTypes.map((movieViewType) {
                              return Container(
                                  margin: EdgeInsets.only(right: MARGIN_SMALL_1X),
                                  child: Text(
                                    movieViewType + ",",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ));
                            }).toList(),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: moviesChip.map((category) {
                              return Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Wrap(
                                  children: [
                                    Text(category),
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
