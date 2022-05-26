import 'package:flutter/material.dart';
import 'widgets/parentID_form.dart';

class ParentIDPage extends StatelessWidget {
  const ParentIDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: ParentIDForm(),
    );
  }
}
