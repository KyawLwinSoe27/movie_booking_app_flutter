import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_booking_app/common_widgets/logo_widgets.dart';
import 'package:movie_booking_app/pages/login_page.dart';
import '../common_widgets/terms_and_policy_widget.dart';
import '../functions/reuse_functions.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';
import 'location_page.dart';

class GetOTPPage extends StatefulWidget {
  @override
  State<GetOTPPage> createState() => _GetOTPPageState();
}

class _GetOTPPageState extends State<GetOTPPage> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ListView(children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: MARGIN_SMALL_2X),
                    child: GestureDetector(
                      onTap: () => router(context, LoginPage()),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MARGIN_SMALL_2X,
                ),
                Logo_Widget(),
                SizedBox(
                  height: MARGIN_LARGE,
                ),
                Sent_OTP_Code_Text_Widget(),
                SizedBox(
                  height: MARGIN_SMALL_2X,
                ),
                Enter_Code_Text_Widget(),
                SizedBox(
                  height: MARGIN_LARGE,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter OTP Code",
                        style: TextStyle(
                          color: LOGIN_SCREEN_SUB_TXT_COLOR,
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_SMALL_2X,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OTP_input_text_widget(_fieldOne, true),
                          OTP_input_text_widget(_fieldTwo, false),
                          OTP_input_text_widget(_fieldThree, false),
                          OTP_input_text_widget(_fieldFour, false),
                          OTP_input_text_widget(_fieldFive, false),
                          OTP_input_text_widget(_fieldSix, false)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_1X,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive OTP?",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: MARGIN_SMALL_1X,
                      ),
                      Text(
                        "Resend Code",
                        style: TextStyle(color: PRIMARY_COLOR),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_1X,
                ),
                Confirm_OTP_BUTTON_WIDGET(() {
                  setState(() {
                    _otp = _fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text +
                        _fieldFive.text +
                        _fieldSix.text;
                  });
                  if (_otp?.length == 6) {
                    router(context, LocationPage());
                  } else {}
                }),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 90,
                ),
                TermsAndPolicyWidget(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class OTP_input_text_widget extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  const OTP_input_text_widget(
    this.controller,
    this.autofocus, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        autofocus: autofocus,
        showCursor: true,
        cursorColor: PRIMARY_COLOR,
        controller: controller,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        maxLength: 1,
        decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

class Confirm_OTP_BUTTON_WIDGET extends StatelessWidget {
  final Function checkValue;
  Confirm_OTP_BUTTON_WIDGET(this.checkValue);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        // onPageChange();
        checkValue();
      },
      color: PRIMARY_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 60,
      ),
      minWidth: double.infinity,
      child: Text(
        CONFIRM_OTP,
        style: TextStyle(color: Colors.black),
      ),
    ));
  }
}

class Enter_Code_Text_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 202,
      height: 36,
      child: Text(
        ENTER_CODE_TEXT,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: LOGIN_SCREEN_SUB_TXT_COLOR,
        ),
      ),
    );
  }
}

class Sent_OTP_Code_Text_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      SENT_OTP_CODE_TEXT,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
      ),
    );
  }
}
