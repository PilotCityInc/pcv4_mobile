// ignore_for_file: non_constant_identifier_names, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:pcv4_mobile/presentation/common/TextStyling/Pallete.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';

// Base alignment for top most component so alignmnet change here will
// unformily change throughtout the entire program
final double baseAlignmentY = -0.5;

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        const Center(
          child: Text(
            'My Profile',
            style: myProfile,
          ),
        ),
        const SizedBox(height: 50),
        Logo(),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'EMAIL',
            style: emailHeading,
          ),
        ),
        const SizedBox(height: 3),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Pilotcity@gmail.com',
            style: emailDisplay,
          ),
        ),
        const SizedBox(height: 350),
        LogoutButton(context),
      ],
    );
  }
}

// This is the code for the Pilotcity Logo that appears on top of the Welcome
Container Logo() {
  return Container(
    alignment: Alignment(0.0, baseAlignmentY - 0.2),
    child: Container(
      width: 84,
      height: 102,
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Login/PilotCity.png'), fit: BoxFit.fill),
      ),
    ),
  );
}

Padding LogoutButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35),
    child: Column(
      children: [
        Container(
          height: 37,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFFC7C8CA), width: 3.0),
              borderRadius: const BorderRadius.all(Radius.circular(5.0))),
          child: MaterialButton(
            onPressed: () => context.router.replace(const ProfilePageRoute()),
            child: const Text(
              'Log Out',
              style: BodyText,
            ),
          ),
        ),
      ],
    ),
  );
}
