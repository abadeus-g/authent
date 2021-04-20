part of 'authenticator_states_bloc.dart';

@freezed
class AuthenticatorStatesEvent with _$AuthenticatorStatesEvent {
  const factory AuthenticatorStatesEvent.authStateRequest() = AuthStateRequest;
  const factory AuthenticatorStatesEvent.signOut() = SignOut;
}