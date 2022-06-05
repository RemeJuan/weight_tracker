import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:weight_tracker/core/network_manager.dart';
import 'package:weight_tracker/core/uri_builder.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/network/network.dart';
import 'package:weight_tracker/network/source.dart';
import 'package:weight_tracker/router/app_router.gr.dart';
import 'package:weight_tracker/router/auth_guard.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_cubit.dart';
import 'package:weight_tracker/screens/login/bloc/login_form_bloc.dart';
import 'package:weight_tracker/screens/register/bloc/register_form_bloc.dart';

final sl = GetIt.instance;

void initService() {
  sl.registerSingleton<UserModel>(UserModel.empty());
  sl.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<UriBuilder>(() => const UriBuilder());
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  sl.registerSingleton<NetworkManager>(
    NetworkManager(client: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<Source>(
    () => Source(uriBuilder: sl(), networkManager: sl()),
  );
  sl.registerLazySingleton<Network>(() => Network(sl()));

  // States
  sl.registerFactory<RegisterFormBloc>(() => RegisterFormBloc(sl()));
  sl.registerFactory<LoginFormBloc>(() => LoginFormBloc(sl()));
  sl.registerFactory<LandingCubit>(() => LandingCubit(sl()));
}
