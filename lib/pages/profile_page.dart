import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import 'package:movie_booking_app/pages/profile_tab_list.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import '../data/models/movie_booking_model.dart';
import '../data/models/movie_booking_model_impl.dart';
import '../functions/reuse_functions.dart';
import '../network/responses/log_out_response.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  final profileTabs = [
    ProfileTabList(Icons.history, "Purchae History"),
    ProfileTabList(Icons.local_offer, "Offer"),
    ProfileTabList(Icons.card_giftcard, "Gift Card"),
    ProfileTabList(Icons.location_on_rounded, "Location"),
    ProfileTabList(Icons.payment, "Payment"),
    ProfileTabList(Icons.help, "Help and Support"),
    ProfileTabList(Icons.logout, "Logout")
  ];

  // State Variable
  UserDataVO? userData;
  String? token;

  @override
  void initState() {
    movieBookingModel.getUserDataFromDatabase().then((userData) {
      setState(() {
        this.userData = userData;
        this.token = userData?.token;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    super.initState();
  }

  Future<LogOutResponse?> logOut() async {
    await movieBookingModel.postLogOut("Bearer $token").then((response) {
      var statusCode = response?.code;
      if (statusCode == 200) {
        if (movieBookingModel.deleteUserDataFromDatabase()) {
          router(context, const LoginPage());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 414,
                height: 300,
                child: Image.asset(
                  "images/profilebg.png",
                  fit: BoxFit.cover,
                ),
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
                return GestureDetector(
                  onTap: () async {
                    if (index == 6) {
                      if (await confirm(
                        context,
                        title: const Text('Confirm'),
                        content: const Text('Are you sure to logout?'),
                        textOK: const Text('Yes'),
                        textCancel: const Text('No'),
                      )) {
                        logOut();
                      }
                      print("No");
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: MARGIN_SMALL_2X,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          profileTabs[index].icon,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: MARGIN_SMALL_2X,
                        ),
                        Text(
                          profileTabs[index].text,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: TITLE_TEXT_FONT_SIZE),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    ),
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
