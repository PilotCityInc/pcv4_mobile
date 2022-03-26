import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pcv4_mobile/domain/auth/auth_failure.dart';
import 'package:pcv4_mobile/domain/auth/i_auth_facade.dart';
import 'package:pcv4_mobile/domain/auth/user.dart';
import 'package:pcv4_mobile/domain/auth/value_objects.dart';
import 'package:pcv4_mobile/injection.dart';

// TODO: implement an actual auth facade
@LazySingleton(as: IAuthFacade, env: [Env.dev])
class FakeAuthFacade implements IAuthFacade {
  @override
  Future<Option<User>> getSignedInUser() async => optionOf(null);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    if (kDebugMode) {
      print("Fake register with $emailAddressStr:$passwordStr");
    }
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    if (kDebugMode) {
      print("Fake sign in with $emailAddressStr:$passwordStr");
    }

    return left(const AuthFailure.serverError());
  }

  @override
  Future<void> signOut() async {
    if (kDebugMode) {
      print("Fake sign out");
    }
  }
}
