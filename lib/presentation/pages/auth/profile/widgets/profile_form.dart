import 'package:pcv4_mobile/presentation/pages/auth/profile/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/auth_bloc.dart';
import 'package:pcv4_mobile/presentation/common/text_styling/palette.dart';

import '../../widgets/logo.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(height: 100),
            const Center(
              child: Text(
                'My Profile',
                style: myProfile,
              ),
            ),
            const SizedBox(height: 50),
            const Logo(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'EMAIL',
                style: emailHeading,
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                state.maybeWhen(
                  authenticated: (user) => user.email.getOrCrash(),
                  orElse: () => 'none',
                ),
                style: emailDisplay,
              ),
            ),
            const SizedBox(height: 350),
            const LogoutButton(),
          ],
        );
      },
    );
  }
}
