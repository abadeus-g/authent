part of 'authenticator_bloc.dart';

@freezed
class AuthenticatorState with _$AuthenticatorState {
  const factory AuthenticatorState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool submitting,
    required Option<Either<AuthFailures, Unit>> authFailureOrSuccessOption,
  }) = _InitialAuthState;

  factory AuthenticatorState.initial() => AuthenticatorState(
        authFailureOrSuccessOption: none(),
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        submitting: false,
      );
}
