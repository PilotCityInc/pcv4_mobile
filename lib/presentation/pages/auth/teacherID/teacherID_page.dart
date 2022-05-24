import 'package:flutter/material.dart';
import 'widgets/teacherID_form.dart';

class TeacherIDPage extends StatelessWidget {
  const TeacherIDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: TeacherIDForm(),
    );
  }
}
