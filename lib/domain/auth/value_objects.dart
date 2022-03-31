import 'package:dartz/dartz.dart';
import 'package:pcv4_mobile/domain/core/value_failures.dart';
import 'package:pcv4_mobile/domain/core/value_objects.dart';
import 'package:pcv4_mobile/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

class PasswordConfirm extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PasswordConfirm(String input, Password compareTo) {
    return compareTo.value.fold(
      (failure) => PasswordConfirm._(
          left(ValueFailure.passwordConfirmNotMatching(failedValue: input))),
      (passwordStr) =>
          PasswordConfirm._(validatePasswordConfirm(input, passwordStr)),
    );
  }

  const PasswordConfirm._(this.value);
}
