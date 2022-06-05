import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:weight_tracker/router/app_router.gr.dart';

final sl = GetIt.instance;

void initService() {
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
}
