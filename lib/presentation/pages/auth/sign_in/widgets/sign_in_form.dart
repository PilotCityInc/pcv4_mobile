import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/auth_failure_snackbar.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

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
            (success) {},
          );
        });
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            children: [
              Image.asset(
                'assets/images/pilotcity.png',
              ),
              const SizedBox(height: 8),
              AutofillGroup(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      autofillHints: const [AutofillHints.email],
                      autocorrect: false,
                      onChanged: (value) => context.read<SignInFormBloc>().add(
                            SignInFormEvent.emailChanged(value),
                          ),
                      validator: (_) => context
                          .read<SignInFormBloc>()
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
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Password',
                      ),
                      autofillHints: const [AutofillHints.password],
                      obscureText: true,
                      onChanged: (value) => context.read<SignInFormBloc>().add(
                            SignInFormEvent.passwordChanged(value),
                          ),
                      validator: (_) => context
                          .read<SignInFormBloc>()
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
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                ],
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(),
                const SizedBox(height: 24),
              ],
              Center(
                child: MaterialButton(
                  child: const Text('Register instead'),
                  onPressed: () =>
                      context.router.replace(const SignUpPageRoute()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
