import 'package:flutter/material.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/router/app_router.gr.dart';

class AppTemplate extends StatelessWidget {
  final Widget child;

  const AppTemplate({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => sl<AppRouter>().replace(const LogoutRoute()),
          ),
        ],
      ),
      body: child,
    );
  }
}
