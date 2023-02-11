import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/strings.dart';

class TermsAndPolicyWidget extends StatelessWidget {
  const TermsAndPolicyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      TERMS_AND_POLICY,
      style: TextStyle(
        color: TERMS_AND_POLICY_COLOR,
      ),
      textAlign: TextAlign.center,
    );
  }
}