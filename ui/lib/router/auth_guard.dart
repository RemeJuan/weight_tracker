import 'package:auto_route/auto_route.dart';
import 'package:weight_tracker/screens/login/utils/auth_utils.dart';

import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(resolver, router) async {
    AuthUtils.loadUserIntoMemory();
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    // We use a simple check to see if an access token exists and "assume"
    // that the user is logged in, the [NetworkManager] will handle the de-authorization
    // when the API returns a 401
    final token = await AuthUtils.fetchToken();
    final isAuthed = token != null && token.isNotEmpty;
    if (isAuthed) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.replace(const LoginRoute());
    }
  }
}
