part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  // TODO: finish sign in form state
  const factory SignInFormState({
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        authFailureOrSuccessOption: none(),
      );
}
