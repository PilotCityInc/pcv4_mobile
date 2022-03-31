// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i10;
import 'application/auth/register_form/register_form_bloc.dart' as _i8;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i9;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'infrastructure/auth/auth0_auth_facade.dart' as _i7;
import 'infrastructure/auth/auth0_auth_service.dart' as _i5;
import 'infrastructure/core/default_http_client.dart' as _i11;
import 'infrastructure/core/local_storage.dart' as _i12;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpClientInjectableModule = _$HttpClientInjectableModule();
  final localStorageInjectableModule = _$LocalStorageInjectableModule();
  gh.lazySingleton<_i3.Client>(() => httpClientInjectableModule.httpClient);
  gh.lazySingleton<_i4.FlutterSecureStorage>(
      () => localStorageInjectableModule.secureStorage);
  gh.lazySingleton<_i5.Auth0AuthService>(
      () => _i5.Auth0AuthService(
          get<_i4.FlutterSecureStorage>(), get<_i3.Client>()),
      registerFor: {_dev});
  gh.lazySingleton<_i6.IAuthFacade>(
      () => _i7.Auth0AuthFacade(get<_i5.Auth0AuthService>()),
      registerFor: {_dev});
  gh.factory<_i8.RegisterFormBloc>(
      () => _i8.RegisterFormBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i9.SignInFormBloc>(
      () => _i9.SignInFormBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(get<_i6.IAuthFacade>()));
  return get;
}

class _$HttpClientInjectableModule extends _i11.HttpClientInjectableModule {}

class _$LocalStorageInjectableModule extends _i12.LocalStorageInjectableModule {
}
