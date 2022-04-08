import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:pcv4_mobile/presentation/common/TextStyling/Pallete.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/auth_failure_snackbar.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  // Base alignment for top most component so alignmnet change here will
  // unformily change throughtout the entire program
  final double baseAlignmentY = -0.5;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.forEach((authFailureOrSuccess) {
          authFailureOrSuccess.fold(
            (authFailure) {
              createAuthFailureSnackbar(authFailure).show(context);
            },
            (success) {},
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
                Logo(),
                const SizedBox(
                  height: 35,
                ),
                WelcomeBack(),
                const SizedBox(
                  height: 20,
                ),
                EmailText(context),
                const SizedBox(
                  height: 20,
                ),
                PasswordText(context),
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
                          style: BodyText,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                LoginButton(context),
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
                        style: BodyText,
                      ),
                      onPressed: () =>
                          context.router.replace(const SignUpPageRoute()),
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

// This is the code for the Pilotcity Logo that appears on top of the Welcome
  Container Logo() {
    return Container(
      alignment: Alignment(0.0, baseAlignmentY - 0.2),
      child: Container(
        width: 84,
        height: 102,
        padding: const EdgeInsets.all(0.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Login/PilotCity.png'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }

// This is the code for the welcome back text
  SafeArea WelcomeBack() {
    return SafeArea(
      child: Container(
        alignment: Alignment(0.0, baseAlignmentY),
        child: const Text(
          'Welcome Back',
          style: PageHeading,
        ),
      ),
    );
  }

  // This is the code for the text fied that takes in the email
  Container EmailText(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, baseAlignmentY + 0.28),
      child: Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
            // color: Colors.transparent,
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          style: const TextStyle(fontSize: 20, color: Colors.white),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.white),
            isDense: true,
          ),
          autofillHints: const [AutofillHints.email],
          onChanged: (value) => context.read<SignInFormBloc>().add(
                SignInFormEvent.emailChanged(value),
              ),
          validator: (_) =>
              context.read<SignInFormBloc>().state.emailAddress.value.fold(
                    (failure) => failure.maybeMap(
                      invalidEmail: (_) => 'Invalid Email',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
        ),
      ),
    );
  }

  PasswordText(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, baseAlignmentY + 0.88),
      child: Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
            // color: Colors.transparent,
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          style: const TextStyle(fontSize: 20, color: Colors.white),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white),
            isDense: true,
          ),
          autofillHints: const [AutofillHints.password],
          obscureText: true,
          onChanged: (value) => context.read<SignInFormBloc>().add(
                SignInFormEvent.passwordChanged(value),
              ),
          validator: (_) =>
              context.read<SignInFormBloc>().state.password.value.fold(
                    (failure) => failure.maybeMap(
                      shortPassword: (_) => 'Short Password',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
        ),
      ),
    );
  }

  Padding LoginButton(BuildContext context) {
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
                style: BodyText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
