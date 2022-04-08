import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pcv4_mobile/domain/auth/auth_failure.dart';
import 'package:pcv4_mobile/domain/auth/i_auth_facade.dart';
import 'package:pcv4_mobile/domain/auth/value_objects.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;

  SignUpFormBloc(this._authFacade) : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>((event, emit) async {
      await event.when(
        emailChanged: (emailStr) async => emit(state.copyWith(
          emailAddress: EmailAddress(emailStr),
          authFailureOrSuccessOption: none(),
        )),
        passwordChanged: (passwordStr) async => emit(state.copyWith(
          password: Password(passwordStr),
          passwordConfirm: PasswordConfirm(
            state.passwordConfirm.value.fold((l) => l.failedValue, (r) => r),
            Password(passwordStr),
          ),
          authFailureOrSuccessOption: none(),
        )),
        passwordConfirmChanged: (passwordConfirmStr) async =>
            emit(state.copyWith(
          passwordConfirm: PasswordConfirm(
            passwordConfirmStr,
            state.password,
          ),
          authFailureOrSuccessOption: none(),
        )),
        registerWithEmailAndPasswordPressed: () async =>
            await _registerWithEmailAndPassword(emit),
      );
    });
  }

  Future<void> _registerWithEmailAndPassword(
    Emitter<SignUpFormState> emit,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isPasswordConfirmValid = state.passwordConfirm.isValid();

    if (isEmailValid && isPasswordValid && isPasswordConfirmValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
