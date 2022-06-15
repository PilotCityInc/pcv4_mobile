import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pcv4_mobile/presentation/pages/auth/sign_in/sign_in_page.dart';
import 'package:pcv4_mobile/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:pcv4_mobile/presentation/pages/splash/splash_page.dart';
import 'package:pcv4_mobile/presentation/pages/auth/profile/profile_page.dart';
import 'package:pcv4_mobile/presentation/pages/auth/teacherID/teacherID_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: '/auth/register',
      page: SignUpPage,
    ),
    AutoRoute(
      path: '/auth/login',
      page: SignInPage,
    ),
    AutoRoute(
      path: '/auth/profile',
      page: ProfilePage,
    ),
    AutoRoute(
      path: '/auth/teacherID',
      page: TeacherIDPage,
    )
  ],
)
class AppRouter extends _$AppRouter {}
