// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Widgets/Widgets.dart';
// 'assets/Login/Background.jpeg'

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [BackgroundImage(Imagesrc: 'assets/Login/Background.jpeg')],
    );
  }
}
