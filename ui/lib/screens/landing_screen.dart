import 'package:flutter/material.dart';
import 'package:weight_tracker/templates/app_template.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const AppTemplate(
      child: Center(
        child: Text("Logged In"),
      ),
    );
  }
}
