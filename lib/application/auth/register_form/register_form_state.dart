part of 'register_form_bloc.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required EmailAddress emailAddress,
    required Password password,
    required PasswordConfirm passwordConfirm,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        passwordConfirm: PasswordConfirm('', Password('')),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
