import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/register_form/register_form_bloc.dart';
import 'package:pcv4_mobile/injection.dart';

import 'register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (context) => getIt<RegisterFormBloc>(),
        child: const RegisterForm(),
      ),
    );
  }
}
