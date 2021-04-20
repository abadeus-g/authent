import 'package:authenticator/presentation/auth/authenticator.dart';
import 'package:authenticator/presentation/auth/sub-screens/authent%20by%20email.dart';
import 'package:authenticator/presentation/auth/sub-screens/authent%20by%20phone.dart';
import 'package:authenticator/presentation/home/home.dart';
import 'package:auto_route/auto_route.dart';

import '../splash.dart';

@CustomAutoRouter(
  generateNavigationHelperExtension: true,
  transitionsBuilder: TransitionsBuilders.fadeIn,
  
  routes: [
    AutoRoute(page: Splash, path: '/splash'),
    AutoRoute(page: Authenticator, name: 'authenticator'),
    AutoRoute(page: AuthentByEmail, path: '/auth/email'),
    AutoRoute(page: AuthentByPhone, path: '/auth/phone'),
    AutoRoute(page: Home, initial: true),
  ],
)
class $AbRoutes {}

/**
 * 
 * extension AbRoutesExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashRoute() => push<Routes>(Routes.splashRoute);

  Future<dynamic> pushAuthenticator() => push<Routes>(Routes.authenticator);

  Future<Routes?> pushAuthentByEmailRoute() =>
      push<Routes>(Routes.authentByEmailRoute);

  Future<Routes?> pushAuthentByPhoneRoute() =>
      push<Routes>(Routes.authentByPhoneRoute);

  Future<Routes?> pushHomeRoute() => push<Routes>(Routes.homeRoute);
}

 * 
 */