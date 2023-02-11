import 'package:flutter/material.dart';

void router(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}