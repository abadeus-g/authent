import 'package:flutter/material.dart';
import 'package:authenticator/presentation/routes/ab_routes.gr.dart';

class AppWidget extends StatelessWidget {
  late final _routes = AbRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routes.defaultRouteParser(),
      routerDelegate: _routes.delegate(
        initialRoutes: [SplashRoute(), HomeRoute(), Authenticator()],
      ),
    );
  }
}
