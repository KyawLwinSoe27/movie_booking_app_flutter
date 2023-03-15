import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

import 'package:movie_booking_app/common_widgets/appbar_title.dart';
import 'package:movie_booking_app/common_widgets/back_to_widget.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimensions.dart';

import '../resources/strings.dart';

class CinemaDetails extends StatelessWidget {
  const CinemaDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: BACKGROUND_COLOR,
        centerTitle: true,
        leading: BackToWidget(),
        title: AppBarTitle(APPBARTITLECINEMADETAILS),
        actions: [
          Container(margin: EdgeInsets.only(right: MARGIN_SMALL_2X),child: Icon(Icons.star_border_rounded,color: Colors.white,),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CinemaBannerSectionWidget(),
            SizedBox(height: MARGIN_SMALL_20,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20,),
                child: CinemaNameAndLocationWidget(),
            ),
            SizedBox(height: MARGIN_MEDIUM_1X,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20,),
                child: CinemaFacilityWidget(),
            ),
            SizedBox(height: MARGIN_MEDIUM_1X,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL_20,),
                child: CinemaSafetyWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class CinemaSafetyWidget extends StatelessWidget {
  const CinemaSafetyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(SAFETY,style: TextStyle(fontWeight: FontWeight.w600,fontSize: TITLE_TEXT_FONT_SIZE,color: Colors.white),),
        SizedBox(height: MARGIN_SMALL_20,),
        Wrap(
          spacing: MARGIN_SMALL_1X,
          runSpacing: MARGIN_SMALL_2X,
          children: [
            SafetyItemWidget("Thermanal Scannig"),
            SafetyItemWidget("Contactless Security Check"),
            SafetyItemWidget("Santization Before Every Show"),
            SafetyItemWidget("Disposable 3D glass"),
            SafetyItemWidget("Contactless Food Serviec"),
            SafetyItemWidget("Package Food "),
            SafetyItemWidget("Deep Cleaning of rest room"),
          ],
        )
      ],
    );
  }
}

class SafetyItemWidget extends StatelessWidget {
  final String text;
  const SafetyItemWidget(this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(BR4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
        child: Text(text,style: TextStyle(fontSize: FONT_SIZE_14,fontWeight: FontWeight.w500,color: Colors.black),),
      ),
    );
  }
}


class CinemaFacilityWidget extends StatelessWidget {
  const CinemaFacilityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(FACILITY,style: TextStyle(fontWeight: FontWeight.w600,fontSize: TITLE_TEXT_FONT_SIZE,color: Colors.white),),
        SizedBox(height: MARGIN_SMALL_20,),
        Wrap(
          spacing: MARGIN_SMALL_16,
          runSpacing: MARGIN_SMALL_16,
          children: [
            FacilitiesWidget(Icons.local_parking,"Parking"),
            FacilitiesWidget(Icons.fastfood,"Online Food"),
            FacilitiesWidget(Icons.wheelchair_pickup,"Wheel Chair"),
            FacilitiesWidget(Icons.cancel_presentation_outlined,"Ticket Cancelation"),
          ],
        )
      ],
    );
  }
}

class FacilitiesWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const FacilitiesWidget(this.icon,this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color: PRIMARY_COLOR,),
          Text(text,style: TextStyle(fontSize: FONT_SIZE_14, fontWeight: FontWeight.w500,color: PRIMARY_COLOR),)
        ],
      ),
    );
  }
}

class CinemaNameAndLocationWidget extends StatelessWidget {
  const CinemaNameAndLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("JCGV : Junction City",style: TextStyle(fontWeight: FontWeight.w600,fontSize: TITLE_TEXT_FONT_SIZE,color: Colors.white),),
        const SizedBox(height: MARGIN_SMALL_16,),
        Row(
          children: const [
            Expanded(child: Text("Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ",style: TextStyle(fontSize: CHOOSE_PAYENT_TITLE_SIZE,color: Colors.white,fontWeight: FontWeight.w600),),),
            SizedBox(width: 50,),
            Icon(Icons.near_me,color: PRIMARY_COLOR,)
          ],
        )
      ],
    );
  }
}

class CinemaBannerSectionWidget extends StatefulWidget {
  const CinemaBannerSectionWidget({Key? key,})  : super(key: key);

  @override
  State<CinemaBannerSectionWidget> createState() => _CinemaBannerSectionWidgetState();
}

class _CinemaBannerSectionWidgetState extends State<CinemaBannerSectionWidget> {
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
    return FlickVideoPlayer(
      flickManager: flickManager,
    );
  }
}

