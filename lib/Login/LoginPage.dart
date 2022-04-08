// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import '../Widgets/Widgets.dart';
import '../TextStyling/Pallete.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
              height: 130,
            ),
            Logo(),
            SizedBox(
              height: 35,
            ),
            WelcomeBack(),
            SizedBox(
              height: 20,
            ),
            EmailText(),
            SizedBox(
              height: 20,
            ),
            PasswordText(),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: BodyText,
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            LoginButton(),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No account yet? Signup.',
                  style: BodyText,
                )
              ],
            )
          ],
        ),
      ),
    ]);
  }

  Padding LoginButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            Container(
                height: 37,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue),
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: BodyText,
                    ))),
          ],
        ));
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
            obscureText: true,
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
