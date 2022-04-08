import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/auth_failure_snackbar.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/palette.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/widgets.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (authFailure) {
              createAuthFailureSnackbar(authFailure).show(context);
            },
            (success) => context.router.replace(
              const SignInPageRoute(),
            ),
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 4),
                child: Image.asset(
                  'assets/images/pilotcity.png',
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'Join the Family.',
                    style: heading,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: AutofillGroup(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextInput(
                            prompt: 'email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            autocorrect: false,
                            autofillHints: const [AutofillHints.email],
                            onChanged: (value) =>
                                context.read<SignUpFormBloc>().add(
                                      SignUpFormEvent.emailChanged(value),
                                    ),
                            validator: (_) => context
                                .read<SignUpFormBloc>()
                                .state
                                .emailAddress
                                .value
                                .fold(
                                  (failure) => failure.maybeMap(
                                    invalidEmail: (_) => 'Invalid Email',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 4,
                            color: Color(0xE679BF89),
                          ),
                          const SizedBox(height: 10),
                          PasswordInput(
                            prompt: 'PASSWORD',
                            inputAction: TextInputAction.done,
                            autofillHints: const [
                              AutofillHints.newPassword,
                              AutofillHints.password,
                            ],
                            onChanged: (value) =>
                                context.read<SignUpFormBloc>().add(
                                      SignUpFormEvent.passwordChanged(value),
                                    ),
                            validator: (_) => context
                                .read<SignUpFormBloc>()
                                .state
                                .password
                                .value
                                .fold(
                                  (failure) => failure.maybeMap(
                                    shortPassword: (_) => 'Short Password',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                          ),
                          const SizedBox(height: 15),
                          PasswordInput(
                            prompt: 'CONFIRM PASSWORD',
                            inputAction: TextInputAction.done,
                            autofillHints: const [
                              AutofillHints.newPassword,
                              AutofillHints.password,
                            ],
                            onChanged: (value) => context
                                .read<SignUpFormBloc>()
                                .add(
                                  SignUpFormEvent.passwordConfirmChanged(value),
                                ),
                            validator: (_) => context
                                .read<SignUpFormBloc>()
                                .state
                                .passwordConfirm
                                .value
                                .fold(
                                  (failure) => failure.maybeMap(
                                    passwordConfirmNotMatching: (_) =>
                                        "Passwords Don't Match",
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          SignupButton(
                            buttonText: 'SIGNUP',
                            onPressed: () {
                              context.read<SignUpFormBloc>().add(
                                    const SignUpFormEvent
                                        .registerWithEmailAndPasswordPressed(),
                                  );
                            },
                          ),
                          if (state.isSubmitting) ...[
                            const SizedBox(height: 10),
                            const LinearProgressIndicator(),
                          ],
                          const SizedBox(height: 10),
                        ],
                      ),
                      TextButton(
                        child: const Text('Have an account? Login',
                            style: navButton),
                        onPressed: () =>
                            context.router.replace(const SignInPageRoute()),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
