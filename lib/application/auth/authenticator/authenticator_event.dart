part of 'authenticator_bloc.dart';

@freezed
class AuthenticatorEvent with _$AuthenticatorEvent {
  const factory AuthenticatorEvent.emailChanged(String emailStr) = EmailChanged;
  const factory AuthenticatorEvent.passwordChanged(String passwordStr) = PasswordChanged;
  const factory AuthenticatorEvent.resgisterWithEmailPressed() = ResgisterWithEmailPressed;
  const factory AuthenticatorEvent.signInWithGithubPressed() = SignInWithGithubPressed;
  const factory AuthenticatorEvent.signInWithEmailPressed() = SignInWithEmailPressed;
  const factory AuthenticatorEvent.signInWithGooglePressed() = SignInWithGooglePressed;
  const factory AuthenticatorEvent.registerWithPhonePressed() = _Started;
}