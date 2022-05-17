import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/sign_in_form/sign_in_form_bloc.dart';

class EmailText extends StatelessWidget {
  const EmailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
}
