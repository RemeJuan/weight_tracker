import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weight_tracker/core/constants.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/router/app_router.gr.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return FutureBuilder(
      future: sl<FlutterSecureStorage>().delete(key: SECURE_API_KEY),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.done) {
          context.router.replace(const LoginRoute());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
