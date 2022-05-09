import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';

class PasswordText extends StatelessWidget {
  const PasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
}
