import 'package:auto_route/annotations.dart';
import 'package:weight_tracker/screens/login_screen.dart';
import 'package:weight_tracker/screens/register_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  preferRelativeImports: false,
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: RegisterScreen),
  ],
)
class $AppRouter {}
