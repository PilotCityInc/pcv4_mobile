import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:pcv4_mobile/presentation/common/text_styling/pallete.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Container(
            height: 37,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.blue),
            child: MaterialButton(
              onPressed: () {
                context.read<SignInFormBloc>().add(
                      const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                    );
              },
              child: const Text(
                'Login',
                style: bodyText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
