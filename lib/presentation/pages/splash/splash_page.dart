import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/auth_bloc.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          authenticated: () {
            // TODO: navigate to an actual page when authenticated
            debugPrint('I am authenticated!!');
            // context.router.replace(const SignInPageRoute());
          },
          unauthenticated: () =>
              context.router.replace(const SignUpPageRoute()),
        );
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset('assets/images/pilotcity.png'),
              ),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
