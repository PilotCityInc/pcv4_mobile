import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pcv4_mobile/domain/auth/auth_failure.dart';

Flushbar createAuthFailureSnackbar(AuthFailure failure) {
  return FlushbarHelper.createError(
    message: failure.map(
      serverError: (_) => 'Server error',
      emailAlreadyInUse: (_) => 'Email already in use',
      emailUnverified: (_) => 'Email unverified',
      invalidEmailAndPasswordCombination: (_) =>
          'Invalid email and password combination',
    ),
  );
}
