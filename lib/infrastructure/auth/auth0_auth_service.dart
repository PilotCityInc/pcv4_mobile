import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pcv4_mobile/domain/auth/auth_failure.dart';
import 'package:pcv4_mobile/injection.dart';

/// This class handles interactions with the PilotCity authentication API.
/// [API endpoints reference](https://www.getpostman.com/collections/59bfc3bfb72fb5e0d58b).
@LazySingleton(env: [Env.dev])
class Auth0AuthService {
  static const _apiHost = 'authentication-service-dev.api.pilotcity.com';
  static const _refreshTokenStorageKey = 'refreshToken';

  final FlutterSecureStorage _storage;
  final http.Client _httpClient;

  String? _accessToken;
  DateTime? _accessTokenExpirationDate;
  String? _refreshToken;
  String? _idToken;
  DateTime? _idTokenExpirationDate;

  Auth0AuthService(this._storage, this._httpClient);

  /// Get current user's access token. This is used to authorize API requests,
  /// and should be treated as an **opaque** token.
  ///
  /// However, in the case of Auth0, this is actually a JWT
  /// that can be decoded using [JwtDecoder.decode] to something like:
  /// ```json
  /// {
  ///   "iss": "https://dev-y6gwqyjk.us.auth0.com/",
  ///   "sub": "auth0|623bcc1bb70c270068de5e52",
  ///   "aud": [
  ///     "https://dev-y6gwqyjk.us.auth0.com/api/v2/",
  ///     "https://dev-y6gwqyjk.us.auth0.com/userinfo"
  ///   ],
  ///   "iat": 1648608698,
  ///   "exp": 1648695098,
  ///   "azp": "aOHKKzFyzOrFOxbcGXF6eQY50ojqMzUK",
  ///   "scope": "openid profile email read:current_user [...]",
  ///   "gty": "password"
  /// }
  /// ```
  /// [More details about access tokens and id tokens](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
  Future<String?> getCurrentAccessToken() async {
    await _attemptRefreshTokensIfNeeded();

    if (_accessTokenExpirationDate == null ||
        _accessTokenExpirationDate!.isBefore(DateTime.now())) {
      return null;
    }
    return _accessToken;
  }

  /// Get current user's id token in JWT format, as defined by OpenID Connect.
  /// This contains various user profile information.
  ///
  /// Decode it using [JwtDecoder.decode] to get something like:
  /// ```json
  /// {
  ///   "nickname": "i",
  ///   "name": "i@cazzzer.com",
  ///   "picture": "https://s.gravatar.com/avatar/02d51b70def019220b3b1606eca1997b?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fi.png",
  ///   "updated_at": "2022-03-30T02:51:37.724Z",
  ///   "email": "i@cazzzer.com",
  ///   "email_verified": true,
  ///   "iss": "https://dev-y6gwqyjk.us.auth0.com/",
  ///   "sub": "auth0|623bcc1bb70c270068de5e52",
  ///   "aud": "aOHKKzFyzOrFOxbcGXF6eQY50ojqMzUK",
  ///   "iat": 1648608698,
  ///   "exp": 1648644698
  /// }
  /// ```
  /// [More details about access tokens and id tokens](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
  Future<String?> getCurrentIdToken() async {
    await _attemptRefreshTokensIfNeeded();

    if (_idTokenExpirationDate == null ||
        _idTokenExpirationDate!.isBefore(DateTime.now())) {
      return null;
    }
    return _idToken;
  }

  /// Make API call to attempt sign in with given email and password;
  /// if successful store the access and id tokens, which can be gotten using
  /// [getCurrentAccessToken] and [getCurrentIdToken].
  Future<Either<AuthFailure, Unit>> signInWithEmailPassword(
      String email, String password) async {
    final response = await _emailPasswordAuthQuery(
      'auth0/sign-in',
      'email_signin',
      email,
      password,
    );
    switch (response.statusCode) {
      case 200:
        final responseData = jsonDecode(response.body)['data'];
        await _updateTokenData(responseData);
        return right(unit);
      case 403:
        final responseError = jsonDecode(response.body)['error'];
        final errorDescription = responseError['description'];
        if (errorDescription.contains('email or password')) {
          return left(const AuthFailure.invalidEmailAndPasswordCombination());
        } else if (errorDescription
            .contains('please verify your email to signin')) {
          return left(const AuthFailure.emailUnverified());
        }
        return left(const AuthFailure.serverError());
      default:
        return left(const AuthFailure.serverError());
    }
  }

  /// Make API call to attempt to register with given email and password.
  ///
  /// TODO: maybe look into removing required email verification
  /// to sign in the user right after registration.
  Future<Either<AuthFailure, Unit>> registerWithEmailPassword(
      String email, String password) async {
    final response = await _emailPasswordAuthQuery(
      'auth0/sign-up',
      'email_signup',
      email,
      password,
    );
    switch (response.statusCode) {
      case 200:
        return right(unit);
      case 403:
        final responseError = jsonDecode(response.body)['error'];
        final errorDescription = responseError['description'];
        if (errorDescription.contains('email already in use')) {
          return left(const AuthFailure.emailAlreadyInUse());
        }
        return left(const AuthFailure.serverError());
      default:
        return left(const AuthFailure.serverError());
    }
  }

  Future<http.Response> _emailPasswordAuthQuery(
      String endpoint, String type, String email, String password) async {
    return await _httpClient.post(
      Uri.https(_apiHost, endpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'type': type,
          'email': email,
          'password': password,
        },
      ),
    );
  }

  Future<void> _attemptRefreshTokensIfNeeded() async {
    // attempt to get refresh token stored in secure storage
    _refreshToken ??= await _storage.read(key: _refreshTokenStorageKey);
    if (_refreshToken == null) return;

    final doTokensExist = _accessToken != null && _idToken != null;
    if (doTokensExist) {
      final areTokensValid =
          _accessTokenExpirationDate!.isAfter(DateTime.now()) ||
              _idTokenExpirationDate!.isAfter(DateTime.now());
      if (areTokensValid) {
        // early return if tokens exist and are not expired
        return;
      }
    }
    final newTokenData = await _tryRefreshTokenQuery();
    if (newTokenData != null) await _updateTokenData(newTokenData);
  }

  /// Attempts to refresh the access and id tokens using the refresh token.
  ///
  /// If successful, returns an object like:
  /// ```json
  /// {
  ///   "access_token": "...",
  ///   "refresh_token": "...",
  ///   "id_token": "...",
  ///   "scope": "openid profile email read:current_user [...]",
  ///   "expires_in": 86400,
  ///   "token_type": "Bearer"
  ///     }
  /// ```
  /// Otherwise returns [null].
  Future<Map<String, dynamic>?> _tryRefreshTokenQuery() async {
    if (_refreshToken == null) return null;

    const endpoint = 'auth0/generate-access-token';

    final response = await _httpClient.post(
      Uri.https(_apiHost, endpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'refresh_token': _refreshToken,
        },
      ),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data'];
      return responseData;
    } else {}
    return null;
  }

  Future<void> _updateTokenData(Map<String, dynamic> tokenData) async {
    _accessToken = tokenData['access_token'];
    _accessTokenExpirationDate = JwtDecoder.getExpirationDate(_accessToken!);
    _refreshToken = tokenData['refresh_token'];
    await _storage.write(key: _refreshTokenStorageKey, value: _refreshToken);
    _idToken = tokenData['id_token'];
    _idTokenExpirationDate = JwtDecoder.getExpirationDate(_idToken!);
  }

  /// Use this to log out the current user.
  ///
  /// This function resets all temporary stored tokens to [null],
  /// as well as removes the refresh token from local storage.
  Future<void> clearTokens() async {
    _accessToken = null;
    _accessTokenExpirationDate = null;
    _refreshToken = null;
    await _storage.delete(key: _refreshTokenStorageKey);
    _idToken = null;
    _idTokenExpirationDate = null;
  }
}
