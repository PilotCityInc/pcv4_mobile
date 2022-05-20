import 'package:flutter/material.dart';
import 'widgets/chnageName_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: ChangeNameForm(),
    );
  }
}