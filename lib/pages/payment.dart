import 'package:flutter/material.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';
import 'package:movie_booking_app/pages/ticket_confirm.dart';

import '../common_widgets/back_to_widget.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: BackToWidget(),
        centerTitle: true,
        title: Text(
          PAYMENT_TEXT,
          style: TextStyle(
              fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PromoCodeTextFieldAndButtonWidget(),
            Container(
              margin: EdgeInsets.only(left: 22,right: 25),
              child: ChoosePaymentWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoosePaymentWidget extends StatelessWidget {
  const ChoosePaymentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Choose your payment type",style: TextStyle(color: PRIMARY_COLOR,fontSize: CHOOSE_PAYENT_TITLE_SIZE,fontWeight: FontWeight.w700),),
        Container(
          margin: EdgeInsets.only(top: MARGIN_SMALL_20),
          height: 500,
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context,int index) {
              return GestureDetector(
                onTap: () {
                  router(context, TicketConfirmPage());
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: MARGIN_SMALL_2X),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.25),),
                    borderRadius: BorderRadius.circular(MARGIN_SMALL_8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16,left: 9,right: 18),
                    child: Row(
                      children: [
                        Icon(Icons.card_giftcard_outlined,color: Colors.white),
                        SizedBox(width: MARGIN_SMALL_2X,),
                        Text("Gift Voucher",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                        Spacer(),
                        Icon(Icons.chevron_right,color: Colors.white),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class PromoCodeTextFieldAndButtonWidget extends StatelessWidget {
  const PromoCodeTextFieldAndButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MARGIN_SMALL_4X,),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 40,right: 26),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: "Enter Your Name",style: TextStyle(color: HOME_PAGE_TAB_CENTER_BG,),
                    cursorColor: PRIMARY_COLOR,
                    decoration: const InputDecoration(
                      labelText: "Your Name",
                      labelStyle: TextStyle(color: PRIMARY_COLOR),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR)
                      )
                    ),
                  ),
                ),
                SizedBox(width: MARGIN_SMALL_2X,),
                Icon(Icons.star,color: Colors.red,size: 10,)
              ],
            ),
          ),
          SizedBox(height: MARGIN_SMALL_30,),
          Container(
              margin: EdgeInsets.only(left: 40,right: 40),
              child: MaterialButton(
                color: PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                onPressed: () {  },
                child: Row(
                  children: [
                    Icon(Icons.local_offer),
                    SizedBox(width: 12,),
                    Text(
                      PAYMENT_OFFER_BUTTON_TEXT,
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
