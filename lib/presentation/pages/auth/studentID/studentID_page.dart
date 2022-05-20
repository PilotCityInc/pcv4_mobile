import 'package:flutter/material.dart';
import 'widgets/studentID_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: StudentIDForm(),
    );
  }
}
