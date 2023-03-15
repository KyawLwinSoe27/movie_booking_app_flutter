import 'package:flutter/material.dart';

import '../resources/dimensions.dart';

class BackToWidget extends StatelessWidget {
  const BackToWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.chevron_left,
          size: CHEVRON_LEFT_FONT_SIZE,
          color: Colors.white,
        ));
  }
}