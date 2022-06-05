import 'package:flutter/material.dart';
import 'package:weight_tracker/screens/register/widgets/register_form.dart';
import 'package:weight_tracker/templates/app_template.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const AppTemplate(
      child: RegisterForm(),
    );
  }
}
