// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    SignUpPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignUpPage());
    },
    SignInPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInPage());
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashPageRoute.name, path: '/'),
        RouteConfig(SignUpPageRoute.name, path: '/auth/register'),
        RouteConfig(SignInPageRoute.name, path: '/auth/login'),
        RouteConfig(ProfilePageRoute.name, path: '/auth/profile')
      ];
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpPageRoute extends PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/auth/register');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [SignInPage]
class SignInPageRoute extends PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/auth/login');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(ProfilePageRoute.name, path: '/auth/profile');

  static const String name = 'ProfilePageRoute';
}
