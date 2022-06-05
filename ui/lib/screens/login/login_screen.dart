import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/router/app_router.gr.dart';
import 'package:weight_tracker/screens/login/widgets/login_form.dart';
import 'package:weight_tracker/templates/app_template.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return AppTemplate(
      actions: const [],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 16),
          Text(
            'Login',
            style: Theme.of(context).textTheme.headline4,
          ),
          const LoginForm(),
          RichText(
            softWrap: true,
            text: TextSpan(children: [
              const TextSpan(
                text: "No account? Click here to ",
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: "Register",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => sl<AppRouter>().push(const RegisterRoute()),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
