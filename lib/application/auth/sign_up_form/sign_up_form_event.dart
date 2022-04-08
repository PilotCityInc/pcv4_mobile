part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.emailChanged(String emailStr) = _EmailChanged;
  const factory SignUpFormEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory SignUpFormEvent.passwordConfirmChanged(
      String passwordConfirmStr) = _PasswordConfirmChanged;
  const factory SignUpFormEvent.registerWithEmailAndPasswordPressed() =
      _RegisterWithEmailAndPasswordPressed;
}
