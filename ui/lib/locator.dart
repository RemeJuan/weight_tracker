import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:weight_tracker/router/app_router.gr.dart';
import 'package:weight_tracker/router/auth_guard.dart';

final sl = GetIt.instance;

void initService() {
  sl.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
}
