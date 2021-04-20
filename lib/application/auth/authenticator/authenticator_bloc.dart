import 'dart:async';

import 'package:authenticator/domain/auth/auth_failures.dart';
import 'package:authenticator/domain/auth/i_auth_repo.dart';
import 'package:authenticator/domain/auth/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticator_event.dart';
part 'authenticator_state.dart';
part 'authenticator_bloc.freezed.dart';

class AuthenticatorBloc extends Bloc<AuthenticatorEvent, AuthenticatorState> {
  late final IAuthRepository _authRepository;
  AuthenticatorBloc(this._authRepository) : super(AuthenticatorState.initial());

  @override
  Stream<AuthenticatorState> mapEventToState(
    AuthenticatorEvent event,
  ) async* {
    // TODOimplement mapEventToState
    yield* event.map(
        emailChanged: (e) async* {
          yield state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccessOption: none(),
          );
        },
        passwordChanged: (e) async* {
          yield state.copyWith(
            password: Password(e.passwordStr),
            authFailureOrSuccessOption: none(),
          );
        },
        resgisterWithEmailPressed: (e) async* {
          yield* _performActionOnAuthFacadeWithEmailAndPassword(
            _authRepository.registerWithEmailAndPassword,
          );
        },
        signInWithEmailPressed: (e) async* {
          yield* _performActionOnAuthFacadeWithEmailAndPassword(
            _authRepository.signInWithEmailAndPassword,
          );
        },
        signInWithGooglePressed: (e) async* {
          yield state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          );
          final failureOrSuccess = await _authRepository.signInWithGoogle();
          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          );
        },
        signInWithGithubPressed: (e) async* {},
        registerWithPhonePressed: (e) async* {});
  }

  Stream<AuthenticatorState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailures, Unit>> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailures, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
