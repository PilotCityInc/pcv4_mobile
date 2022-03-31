import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pcv4_mobile/domain/auth/auth_failure.dart';
import 'package:pcv4_mobile/domain/auth/i_auth_facade.dart';
import 'package:pcv4_mobile/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.when(
        emailChanged: (emailStr) async => emit(state.copyWith(
          emailAddress: EmailAddress(emailStr),
          authFailureOrSuccessOption: none(),
        )),
        passwordChanged: (passwordStr) async => emit(state.copyWith(
          password: Password(passwordStr),
          authFailureOrSuccessOption: none(),
        )),
        signInWithEmailAndPasswordPressed: () async =>
            await _signInWithEmailAndPassword(emit),
      );
    });
  }

  Future<void> _signInWithEmailAndPassword(
    Emitter<SignInFormState> emit,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
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
