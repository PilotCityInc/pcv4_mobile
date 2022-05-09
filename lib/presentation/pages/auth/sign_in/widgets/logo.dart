import 'package:flutter/material.dart';

/// This is the widget for the Pilotcity Logo
/// that appears on top of the Welcome.
class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 84,
        height: 102,
        padding: const EdgeInsets.all(0.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pilotcity.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
