import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/auth_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:pcv4_mobile/presentation/common/text_styling/palette.dart';
import 'package:pcv4_mobile/presentation/pages/auth/sign_in/widgets/email_text.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/auth_failure_snackbar.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

import 'login_button.dart';
import '../../widgets/logo.dart';
import 'password_text.dart';
import 'welcome_back.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.forEach((authFailureOrSuccess) {
          authFailureOrSuccess.fold(
            (authFailure) {
              createAuthFailureSnackbar(authFailure).show(context);
            },
            (success) {
              context.router.replace(const ProfilePageRoute());
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
            },
          );
        });
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: AutofillGroup(
            child: ListView(
              children: [
                const SizedBox(
                  height: 130,
                ),
                const Logo(),
                const SizedBox(
                  height: 35,
                ),
                const WelcomeBack(),
                const SizedBox(
                  height: 20,
                ),
                const EmailText(),
                const SizedBox(
                  height: 20,
                ),
                const PasswordText(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Forgot Password?',
                          style: bodyText,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                const LoginButton(),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                  const SizedBox(height: 24),
                ],
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text(
                        'No account yet? Signup.',
                        style: bodyText,
                      ),
                      onPressed: () =>
                          context.router.replace(const TeacherPageRoute()),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
