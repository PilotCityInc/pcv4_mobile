import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:pcv4_mobile/injection.dart';
import 'widgets/widgets.dart';
import './widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(Imagesrc: 'assets/Login/Background.jpeg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocProvider(
              create: (context) => getIt<SignInFormBloc>(),
              child: const SignInForm(),
            ),
          ),
        ),
      ],
    );
  }
}
