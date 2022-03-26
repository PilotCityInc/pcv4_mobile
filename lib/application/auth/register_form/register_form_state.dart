part of 'register_form_bloc.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  // TODO: finish register form state
  const factory RegisterFormState({
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        authFailureOrSuccessOption: none(),
      );
}
