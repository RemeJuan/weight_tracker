// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:weight_tracker/router/auth_guard.dart' as _i7;
import 'package:weight_tracker/screens/landing_screen.dart' as _i4;
import 'package:weight_tracker/screens/login_screen.dart' as _i1;
import 'package:weight_tracker/screens/logout_screen.dart' as _i3;
import 'package:weight_tracker/screens/register/register_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterScreen());
    },
    LogoutRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LogoutScreen());
    },
    LandingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LandingScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i5.RouteConfig(LogoutRoute.name, path: '/logout-screen'),
        _i5.RouteConfig(LandingRoute.name,
            path: '/landing-screen', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.LogoutScreen]
class LogoutRoute extends _i5.PageRouteInfo<void> {
  const LogoutRoute() : super(LogoutRoute.name, path: '/logout-screen');

  static const String name = 'LogoutRoute';
}

/// generated route for
/// [_i4.LandingScreen]
class LandingRoute extends _i5.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing-screen');

  static const String name = 'LandingRoute';
}
