import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pcv4_mobile/presentation/pages/auth/register_page.dart';
import 'package:pcv4_mobile/presentation/pages/auth/sign_in_page.dart';
import 'package:pcv4_mobile/presentation/pages/splash/splash_page.dart';

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
      page: RegisterPage,
    ),
    AutoRoute(
      path: '/auth/login',
      page: SignInPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
