import 'package:auto_route/annotations.dart';
import 'package:weight_tracker/router/auth_guard.dart';
import 'package:weight_tracker/screens/landing_screen.dart';
import 'package:weight_tracker/screens/login_screen.dart';
import 'package:weight_tracker/screens/logout_screen.dart';
import 'package:weight_tracker/screens/register/register_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  preferRelativeImports: false,
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: LogoutScreen),
    AutoRoute(page: LandingScreen, initial: true, guards: [AuthGuard]),
  ],
)
class $AppRouter {}
