import 'dart:async';
import 'dart:developer';

import 'package:authenticator/presentation/app/bloc%20observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'presentation/app/app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runZonedGuarded(
    () => runApp(AppWidget()),
    onError,
  );
  //runApp(MyApp());
}

onError(error, stackTrace) => log(error.toString(), stackTrace: stackTrace);
