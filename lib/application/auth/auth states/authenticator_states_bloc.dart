import 'dart:async';

import 'package:authenticator/domain/auth/i_auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authenticator_states_event.dart';
part 'authenticator_states_state.dart';
part 'authenticator_states_bloc.freezed.dart';

@injectable
class AuthenticatorStatesBloc
    extends Bloc<AuthenticatorStatesEvent, AuthenticatorStatesState> {
  late final IAuthRepository _authRepository;
  AuthenticatorStatesBloc(this._authRepository) : super(Initial());

  @override
  Stream<AuthenticatorStatesState> mapEventToState(
    AuthenticatorStatesEvent event,
  ) async* {
    // TODOimplement mapEventToState
    yield* event.map(
      authStateRequest: (e) async* {
        final optionalUser = await _authRepository.getSignedInUser();
        yield optionalUser.fold(
          () => const AuthenticatorStatesState.unAuthenticated(),
          (_) => const AuthenticatorStatesState.authenticated(),
        );
      },
      signedOut: (e) async* {
        await _authRepository.signOut();
        yield const AuthenticatorStatesState.unAuthenticated();
      },
    );
  }
}
/**
 * 

     
 */
