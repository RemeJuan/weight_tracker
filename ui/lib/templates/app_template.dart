import 'package:flutter/material.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/router/app_router.gr.dart';

class AppTemplate extends StatelessWidget {
  final Widget child;
  final List<Widget>? actions;

  const AppTemplate({
    required this.child,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        actions: actions ??
            [
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
