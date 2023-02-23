import 'package:flutter/material.dart';

import '../resources/colors.dart';

class NumberOfTicketsWidget extends StatelessWidget {
  final String ticketQty;
  NumberOfTicketsWidget(this.ticketQty,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "M-Ticket(",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR)),
          TextSpan(
              text: ticketQty,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR)),
          TextSpan(
              text: ")",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: CHOOSE_CINEMA_PAGE_SERVICE_COLOR))
        ]));
  }
}