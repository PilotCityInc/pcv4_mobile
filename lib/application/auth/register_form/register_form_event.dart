part of 'register_form_bloc.dart';

@freezed
class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.emailChanged(String emailStr) = _EmailChanged;
  const factory RegisterFormEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory RegisterFormEvent.passwordConfirmChanged(
      String passwordConfirmStr) = _PasswordConfirmChanged;
  const factory RegisterFormEvent.registerWithEmailAndPasswordPressed() =
      _RegisterWithEmailAndPasswordPressed;
}
