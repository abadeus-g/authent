part of 'authenticator_states_bloc.dart';

@freezed
class AuthenticatorStatesState with _$AuthenticatorStatesState {
  const factory AuthenticatorStatesState.initial() = Initial;
  const factory AuthenticatorStatesState.authenticated() = Authenticated;
  const factory AuthenticatorStatesState.unAuthenticated() = UnAuthenticated;
}
