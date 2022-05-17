import 'package:flutter/material.dart';
import 'package:pcv4_mobile/presentation/common/text_styling/palette.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Welcome Back',
          style: pageHeading,
        ),
      ),
    );
  }
}
