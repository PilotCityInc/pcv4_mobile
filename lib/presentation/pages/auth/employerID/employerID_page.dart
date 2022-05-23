import 'package:flutter/material.dart';
import 'widgets/employerID_form.dart';

class EmployerIDPage extends StatelessWidget {
  const EmployerIDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: EmployerIDForm(),
    );
  }
}
