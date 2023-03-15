import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:movie_booking_app/common_widgets/logo_widgets.dart';
import 'package:movie_booking_app/data/models/movie_booking_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_model_impl.dart';
import 'package:movie_booking_app/data/vos/authentication_vo.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import '../common_widgets/terms_and_policy_widget.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MovieBookingModel movieBookingModel = MovieBookingModelImpl();

  //State Variable
  // AuthenticationVO? inputPhoneNumber;

  @override
  void initState() {
    movieBookingModel.postPhoneNumber(int.parse(phoneNumber));
    // TODO: implement initState
    super.initState();
  }


  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    // print(phoneNumber.replaceAll("+95", "0"));
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ListView(children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(left: MARGIN_SMALL_4X, right: MARGIN_SMALL_4X, top: MARGIN_MEDIUM_2X),
            child: Column(
              children: [
                const LogoWidget(),
                const SizedBox(
                  height: MARGIN_LARGE,
                ),
                const VerifyPhoneNumberTextWidget(),
                const SizedBox(
                  height: MARGIN_SMALL_2X,
                ),
                const SendCodeInfoTextWidget(),
                const SizedBox(
                  height: MARGIN_LARGE,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Country Code",
                      style: TextStyle(
                          color: LOGIN_SCREEN_SUB_TXT_COLOR, fontSize: 12),
                    ),
                    Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (value) {
                            setState(() {
                              phoneNumber = value.phoneNumber!;
                            });
                          },
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          countrySelectorScrollControlled: true,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Enter a phone Number";
                            }else if(value.length != 12) {
                              return "Enter a valid phone number";
                            }
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                            showFlags: false,
                          ),
                          selectorTextStyle: const TextStyle(color: Colors.white),
                          inputDecoration: const InputDecoration(
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
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          spaceBetweenSelectorAndTextField: 20,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: MARGIN_SMALL_4X,
                ),
                VerifyYourPhoneNumber(phoneNumber),
                const SizedBox(
                  height: 20,
                ),
                const DividerWidget(),
                const SizedBox(
                  height: 20,
                ),
                const ContinueWithGoogleButton(),
                const SizedBox(
                  height: 90,
                ),
                const TermsAndPolicyWidget(),
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
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      minWidth: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: Image.asset("images/Google.png"),
          ),
          const SizedBox(
            width: MARGIN_SMALL_2X,
          ),
          const Text(
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
            margin: const EdgeInsets.only(right: 20),
            child: const Divider(
              color: Colors.white,
            ),
          ),
        ),
        const Text(
          "OR",
          style: TextStyle(color: Colors.white),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Divider(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}


class VerifyYourPhoneNumber extends StatelessWidget {
  final String phoneNumber;
  VerifyYourPhoneNumber(this.phoneNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
    if(phoneNumber.isNotEmpty && phoneNumber.startsWith("+95") && phoneNumber.length == 13){
      router(context, GetOTPPage());
    }
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
    );
  }
}

class SendCodeInfoTextWidget extends StatelessWidget {
  const SendCodeInfoTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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

class VerifyPhoneNumberTextWidget extends StatelessWidget {
  const VerifyPhoneNumberTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      LOGIN_SCREEN_MAIN_TEXT,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
      ),
    );
  }
}
