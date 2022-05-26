import 'package:flutter/material.dart';
import 'widgets/organizerID_form.dart';

class OrganizerIDPage extends StatelessWidget {
  const OrganizerIDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: OrganizerIDForm(),
    );
  }
}
