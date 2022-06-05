// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:weight_tracker/router/auth_guard.dart' as _i6;
import 'package:weight_tracker/screens/landing_screen.dart' as _i3;
import 'package:weight_tracker/screens/login_screen.dart' as _i1;
import 'package:weight_tracker/screens/register_screen.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterScreen());
    },
    LandingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LandingScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LoginRoute.name, path: '/'),
        _i4.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i4.RouteConfig(LandingRoute.name,
            path: '/landing-screen', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.LandingScreen]
class LandingRoute extends _i4.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing-screen');

  static const String name = 'LandingRoute';
}
