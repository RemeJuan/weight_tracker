import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/network/network.dart';
import 'package:weight_tracker/screens/login/utils/auth_utils.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final Network network;

  LoginFormBloc(this.network) : super(isLoading: true) {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password,
      ],
    );
  }

  final username = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );
  final password = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );

  @override
  void submit() async {
    emitSubmitting();

    final user = sl<UserModel>().copyWith(
      username: username.value,
      password: password.value,
    );

    try {
      final inputEither = await network.loginUser(user);
      inputEither.fold(
        (l) => emitFailure(failureResponse: l.toString()),
        (r) async {
          await AuthUtils.storeUser(r);
          await AuthUtils.storeToken(r);

          emitSuccess();
        },
      );
    } catch (e) {
      print(e);
      emitFailure(failureResponse: e.toString());
    }
  }

  @override
  void onSubmitting() {
    emitSuccess();
  }

  @override
  void onLoading() {
    emitLoaded();
  }
}
