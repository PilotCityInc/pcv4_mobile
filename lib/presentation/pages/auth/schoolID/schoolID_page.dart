import 'package:flutter/material.dart';
import 'widgets/schoolID_form.dart';

class SchoolIDPage extends StatelessWidget {
  const SchoolIDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: SchoolIDForm(),
    );
  }
}
