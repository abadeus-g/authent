import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // TODOimplement onEvent
    log('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    // TODOimplement onError
    log('onError (${bloc.runtimeType}, $error, $stacktrace)');
    super.onError(bloc, error, stacktrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // TODOimplement onChange
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // TODOimplement onTransition
    log('onTransition(${bloc.runtimeType}, $transition, event ${transition.event})');
  }
}
