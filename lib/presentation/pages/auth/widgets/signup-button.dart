import 'package:flutter/material.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/palette.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xE679BF89),
        border: Border.all(color: Colors.white),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            buttonText,
            style: body,
          ),
        ),
      ),
    );
  }
}
