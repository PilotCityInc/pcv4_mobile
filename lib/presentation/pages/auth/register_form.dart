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
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          // TODO: connect register form UI with register form state
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
                      autofillHints: const [AutofillHints.newPassword],
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Confirm Password',
                      ),
                      autofillHints: const [AutofillHints.newPassword],
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
              Expanded(
                child: MaterialButton(
                  child: const Text("Sign in instead"),
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
