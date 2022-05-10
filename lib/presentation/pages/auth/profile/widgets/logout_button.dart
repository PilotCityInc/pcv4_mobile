import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/auth_bloc.dart';
import 'package:pcv4_mobile/presentation/common/text_styling/palette.dart';
import 'package:pcv4_mobile/presentation/routes/app_router.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Container(
            height: 37,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: const Color(0xFFC7C8CA), width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            child: MaterialButton(
              onPressed: () => {
                context.read<AuthBloc>().add(const AuthEvent.signedOut()),
                context.router.replace(const SignUpPageRoute())
              },
              child: const Text(
                'Log Out',
                style: bodyText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
