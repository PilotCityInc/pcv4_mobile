import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:pcv4_mobile/injection.dart';
import 'package:pcv4_mobile/presentation/pages/auth/sign_up/widgets/sign_up_form.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocProvider(
              create: (context) => getIt<SignUpFormBloc>(),
              child: const SignUpForm(),
            ),
          ),
        ),
      ],
    );
  }
}
