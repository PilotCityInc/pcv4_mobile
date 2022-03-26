import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          // TODO: connect sign in form UI with sign in form state
          child: ListView(
            children: [
              Image.asset(
                'assets/images/PilotCity.png',
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
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Password',
                      ),
                      autofillHints: const [AutofillHints.password],
                      obscureText: true,
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
              Expanded(
                child: MaterialButton(
                  child: const Text("Register instead"),
                  onPressed: () =>
                      context.router.replace(const RegisterPageRoute()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
