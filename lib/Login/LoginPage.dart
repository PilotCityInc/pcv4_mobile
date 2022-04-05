// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../Widgets/Widgets.dart';
import '../TextStyling/Pallete.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // Base alignment for top most component so alignmnet change here will
  // unformily change throughtout the entire program
  final double BaseAlignmentY = -0.5;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(Imagesrc: 'assets/Login/Background.jpeg'),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            Logo(),
            WelcomeBack(),
            EmailText(),
            PasswordText(),
          ],
        ),
      ),
    ]);
  }

  Container PasswordText() {
    return Container(
        alignment: Alignment(0.0, BaseAlignmentY + 0.88),
        child: Container(
          width: 320,
          height: 50,
          decoration: BoxDecoration(
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white),
              isDense: true,
            ),
          ),
        ));
  }

  // This is the code for the text fied that takes in the email
  Container EmailText() {
    return Container(
        alignment: Alignment(0.0, BaseAlignmentY + 0.28),
        child: Container(
          width: 320,
          height: 50,
          decoration: BoxDecoration(
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              isDense: true,
            ),
          ),
        ));
  }

  // This is the code for the welcome back text
  SafeArea WelcomeBack() {
    return SafeArea(
        child: Container(
      alignment: Alignment(0.0, BaseAlignmentY),
      child: Text(
        'Welcome Back',
        style: PageHeading,
      ),
    ));
  }

  // This is the code for the Pilotcity Logo that appears on top of the Welcome
  Container Logo() {
    return Container(
        alignment: Alignment(0.0, BaseAlignmentY - 0.2),
        child: Container(
            width: 84,
            height: 102,
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Login/PilotCity.png'),
                    fit: BoxFit.fill))));
  }
}
