import 'package:flutter/material.dart';
import 'package:weight_tracker/templates/app_template.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const AppTemplate(
      child: Center(
        child: Text("Login"),
      ),
    );
  }
}
