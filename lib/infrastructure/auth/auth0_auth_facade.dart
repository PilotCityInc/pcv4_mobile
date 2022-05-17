import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pcv4_mobile/domain/auth/auth_failure.dart';
import 'package:pcv4_mobile/domain/auth/i_auth_facade.dart';
import 'package:pcv4_mobile/domain/auth/user.dart';
import 'package:pcv4_mobile/domain/auth/value_objects.dart';
import 'package:pcv4_mobile/infrastructure/auth/auth0_auth_service.dart';
import 'package:pcv4_mobile/injection.dart';

@LazySingleton(as: IAuthFacade, env: [Env.dev])
class Auth0AuthFacade implements IAuthFacade {
  final Auth0AuthService _auth0Service;

  Auth0AuthFacade(this._auth0Service);

  @override
  Future<Option<User>> getSignedInUser() async {
    final idToken = await _auth0Service.getCurrentIdToken();
    if (idToken == null) return none();
    final idTokenData = JwtDecoder.decode(idToken);
    // for Auth0, 'sub' (OpenIDConnect subject) is in the format 'auth0|xxxx...'
    // so slicing the string gives just the 'xxxx...' uid part
    final userId = idTokenData['sub'].substring(5);
    return some(
      User(
        id: userId,
        email: EmailAddress(idTokenData['email']),
      ),
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    return await _auth0Service.registerWithEmailPassword(emailStr, passwordStr);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    return await _auth0Service.signInWithEmailPassword(emailStr, passwordStr);
  }

  @override
  Future<void> signOut() async {
    await _auth0Service.clearTokens();
  }
}
