import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_booking_app/common_widgets/rating_level.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/data/vos/cast_vo.dart';
import 'package:movie_booking_app/data/vos/movies_vo.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/network/api_constant.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';

import '../common_widgets/IMDb_widget.dart';
import '../common_widgets/booking_button.dart';
import '../common_widgets/crd_widget.dart';
import '../resources/dimensions.dart';
import 'choose_time_and_cinema.dart';

class MovieDetails extends StatefulWidget {
  final checkNowAndComing;
  final movieId;
  const MovieDetails(this.checkNowAndComing, {Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  MovieBookingModel movieBookingModel = MovieBookingModelImpl();


  late FlickManager flickManager;
  MoviesVO? movieDetails;
  List<CastVO>? casts;
  String? token;


  @override
  void initState() {
    movieBookingModel.getUserDataFromDatabase().then((user) {
      setState(() {
        token = user?.token ?? "";
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieBookingModel.getMovieDetails(widget.movieId).then((movieDetails) {
      setState(() {
        this.movieDetails = movieDetails;
        this.casts = movieDetails?.casts;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

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
    print(" Movie Details ======> $token");
    List<String> moviesChip = movieDetails?.genres ?? [];
    List<String> movieViewTypes = ["2D", "3D", "3D IMAGE"];
    if(movieDetails != null){
      return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BannerSectionView(
                      flickManager: flickManager,
                      moviesChip: moviesChip,
                      movieViewTypes: movieViewTypes,
                      movie: movieDetails
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
                    child: Row(
                      children: [
                        CRDWidgetView("Censor Rating", "U"),
                        Spacer(),
                        CRDWidgetView("Realease date", movieDetails?.releaseDate ?? ""),
                        Spacer(),
                        CRDWidgetView("Duration", "2hr 15min")
                      ],
                    ),
                  ), //Extract Widget
                  Visibility(
                    visible: widget.checkNowAndComing,
                    child: NotiReleaseWidgetView(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    child: StoryLineWidgetView(storyLine : movieDetails?.overview),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                    child: CastWidgetView(
                        checkNowAndComing: widget.checkNowAndComing, casts : casts),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !widget.checkNowAndComing,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: MARGIN_SMALL_20),
                  child: BookingButton(
                    "Booking",
                    ChooseTimeAndCinema(token: token ?? ""),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }else {
      return const Center(child: CircularProgressIndicator());
    }

  }
}

class NotiReleaseWidgetView extends StatelessWidget {
  const NotiReleaseWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 17, right: 17, bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.6),
                Color.fromRGBO(204, 204, 204, 0.6),
                Color.fromRGBO(221, 221, 221, 0.3)
              ])),
      child: Row(
        children: [
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Releasing in 5 days",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MARGIN_SMALL_2X,
                    ),
                    Text(
                      "Get notify as soon as movie booking opens up in your city!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                    ),
                    SizedBox(
                      height: MARGIN_SMALL_20,
                    ),
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
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Set Notification",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 17,
          ),
          Container(
            width: 110,
            height: 127,
            child:
                Image.asset("images/human_illustrate.png", fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}

class CastWidgetView extends StatelessWidget {
  final bool checkNowAndComing;
  List<CastVO>? casts;
  CastWidgetView({
    required this.checkNowAndComing,
    required this.casts,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: MARGIN_SMALL_20,
        ),
        SizedBox(
          height: 300,
          child: Container(
            margin:const EdgeInsets.only(
              bottom: 30,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(right: 23, bottom: 50),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "$IMAGE_BASE_URL${casts?[index].profilePath}",
                              ),
                            )),
                        const SizedBox(
                          height: 9,
                        ),
                        SizedBox(
                          width: 50,
                          child: Text(
                            casts?[index].name ?? "",
                            style:const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                },
            ),
          ),
        ),
      ],
    );
  }
}

class StoryLineWidgetView extends StatelessWidget {
  final String? storyLine;
  const StoryLineWidgetView({
    Key? key,
    required this.storyLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Story Line",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: MARGIN_SMALL_3X,
        ),
        Text(
          storyLine ?? "",
          style: const TextStyle(
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
    required this.movie,
  }) : super(key: key);

  final FlickManager flickManager;
  final List<String> moviesChip;
  final List<String> movieViewTypes;
  final MoviesVO? movie;

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
                      "$IMAGE_BASE_URL${movie?.posterPath}",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  movie?.originalTitle ?? "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              IMDbWidgetView(),
                              SizedBox(
                                width: 2,
                              ),
                              RatingWidgetView(movie?.rating.toString() ?? "")
                            ],
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            children: movieViewTypes.map((movieViewType) {
                              return Container(
                                  margin:
                                      EdgeInsets.only(right: MARGIN_SMALL_1X),
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
                          Wrap(
                            children: moviesChip.map((category) {
                              return Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Chip(
                                  label: Text(category),
                                  backgroundColor: PRIMARY_COLOR,
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
