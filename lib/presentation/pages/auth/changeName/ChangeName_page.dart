import 'package:flutter/material.dart';
import 'widgets/changeName_form.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF404142),
      body: ChangeNameForm(),
    );
  }
}
