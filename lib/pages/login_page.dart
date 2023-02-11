import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:movie_booking_app/common_widgets/logo_widgets.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import '../common_widgets/terms_and_policy_widget.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ListView(children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(left: MARGIN_SMALL_4X, right: MARGIN_SMALL_4X, top: MARGIN_MEDIUM_2X),
            child: Column(
              children: [

                Logo_Widget(),
                SizedBox(
                  height: MARGIN_LARGE,
                ),
                Verify_Phone_Number_Text_Widget(),
                SizedBox(
                  height: MARGIN_SMALL_2X,
                ),
                Send_Code_Info_Text_Widget(),
                SizedBox(
                  height: MARGIN_LARGE,
                ),
                PhoneNumberInputFormWidget(),
                SizedBox(
                  height: MARGIN_SMALL_4X,
                ),
                VerifyYourPhoneNumber(() => Navigator.push(context, MaterialPageRoute(builder: (context) => GetOTPPage(),),),),
                SizedBox(
                  height: 20,
                ),
                DividerWidget(),
                SizedBox(
                  height: 20,
                ),
                ContinueWithGoogleButton(),
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

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      onPressed: () {},
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      minWidth: double.infinity,
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            child: Image.asset("images/Google.png"),
          ),
          SizedBox(
            width: MARGIN_SMALL_2X,
          ),
          Text(
            CONTINUE_WITH_GOOGLE,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ));
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "OR",
          style: TextStyle(color: Colors.white),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneNumberInputFormWidget extends StatelessWidget {
  const PhoneNumberInputFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Country Code",
            style: TextStyle(
                color: LOGIN_SCREEN_SUB_TXT_COLOR, fontSize: 12),
          ),
          Stack(
            children: [
              InternationalPhoneNumberInput(
                onInputChanged: (value) {
                  print(value);
                },
                autoValidateMode: AutovalidateMode.onUserInteraction,
                countrySelectorScrollControlled: true,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Please Enter a phone Number";
                  }else if(value.length > 11 || value.length < 11) {
                    return "Enter a valid phone number";
                  }
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                  showFlags: false,

                ),
                selectorTextStyle: TextStyle(color: Colors.white),
                inputDecoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: "Mobile Phone Number",
                  hintStyle: TextStyle(
                    color: LOGIN_SCREEN_SUB_TXT_COLOR,
                    fontSize: 16,
                  ),
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                spaceBetweenSelectorAndTextField: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VerifyYourPhoneNumber extends StatelessWidget {
  final Function onPageChange;
  VerifyYourPhoneNumber(this.onPageChange);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        onPageChange();
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
        VERIFY_YOUR_PHONE_NUMBER_BUTTON,
        style: TextStyle(color: Colors.black),
      ),
    ));
  }
}

class Send_Code_Info_Text_Widget extends StatelessWidget {
  const Send_Code_Info_Text_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 202,
      height: 36,
      child: Text(
        LOGIN_SCREEN_SUB_TEXT,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: LOGIN_SCREEN_SUB_TXT_COLOR,
        ),
      ),
    );
  }
}

class Verify_Phone_Number_Text_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      LOGIN_SCREEN_MAIN_TEXT,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
      ),
    );
  }
}
