import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/router/app_router.gr.dart';
import 'package:weight_tracker/screens/login/bloc/login_form_bloc.dart';
import 'package:weight_tracker/shared/widgets/loading_dialog.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocProvider<LoginFormBloc>(
      create: (_) => sl<LoginFormBloc>(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginFormBloc>();

          return FormBlocListener<LoginFormBloc, String, String>(
            onSubmitting: (context, state) {
              LoadingDialog.show(context);
            },
            onSuccess: (context, state) {
              LoadingDialog.hide(context);
              sl<AppRouter>().push(const LandingRoute());
            },
            onFailure: (context, state) {
              LoadingDialog.hide(context);
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              physics: const ClampingScrollPhysics(),
              child: AutofillGroup(
                child: Column(
                  children: [
                    TextFieldBlocBuilder(
                      textFieldBloc: bloc.username,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: bloc.password,
                      suffixButton: SuffixButton.obscureText,
                      autofillHints: const [AutofillHints.password],
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: bloc.submit,
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
