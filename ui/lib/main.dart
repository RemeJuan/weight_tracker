import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/router/app_router.gr.dart';

import 'bootstrap.dart';
import 'locator.dart';

void main() {
  bootstrap(() => const WeightTrackerApp());
}

class WeightTrackerApp extends StatelessWidget {
  const WeightTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final appRouter = sl<AppRouter>();
    return MaterialApp.router(
      title: 'Weight Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
      ),
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
