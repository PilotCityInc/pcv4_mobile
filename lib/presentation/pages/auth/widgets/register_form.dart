import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/register_form/register_form_bloc.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.forEach((authFailureOrSuccess) {
          authFailureOrSuccess.fold(
            // TODO: show actual error message on auth failure
            (authFailure) => debugPrint('auth failed: $authFailure}'),
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
                'assets/images/pilot_city.png',
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
                      onChanged: (value) =>
                          context.read<RegisterFormBloc>().add(
                                RegisterFormEvent.emailChanged(value),
                              ),
                      validator: (_) => context
                          .read<RegisterFormBloc>()
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
                      autofillHints: const [AutofillHints.newPassword],
                      obscureText: true,
                      onChanged: (value) =>
                          context.read<RegisterFormBloc>().add(
                                RegisterFormEvent.passwordChanged(value),
                              ),
                      validator: (_) => context
                          .read<RegisterFormBloc>()
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
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Confirm Password',
                      ),
                      autofillHints: const [AutofillHints.newPassword],
                      obscureText: true,
                      onChanged: (value) =>
                          context.read<RegisterFormBloc>().add(
                                RegisterFormEvent.passwordConfirmChanged(value),
                              ),
                      validator: (_) => context
                          .read<RegisterFormBloc>()
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
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<RegisterFormBloc>().add(
                              const RegisterFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
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
                  child: const Text('Sign in instead'),
                  onPressed: () =>
                      context.router.replace(const SignInPageRoute()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
