import 'package:flutter/material.dart';

class AppTemplate extends StatelessWidget {
  final Widget child;

  const AppTemplate({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(body: child);
  }
}
