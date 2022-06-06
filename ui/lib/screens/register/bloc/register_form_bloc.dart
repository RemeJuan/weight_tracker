import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:weight_tracker/models/user_model.dart';
import 'package:weight_tracker/network/network.dart';
import 'package:weight_tracker/screens/login/utils/auth_utils.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final Network network;

  RegisterFormBloc(this.network) : super(isLoading: true) {
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        lastName,
        username,
        password,
        confirmPassword,
      ],
    );

    confirmPassword
      ..addValidators([FieldBlocValidators.confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
  }

  final firstName = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );
  final lastName = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );
  final username = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );
  final password = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );
  final confirmPassword = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );

  @override
  void submit() async {
    emitSubmitting();

    final user = UserModel(
      firstName: firstName.value,
      lastName: lastName.value,
      username: username.value,
      password: password.value,
    );

    try {
      final inputEither = await network.registerUser(user);
      inputEither.fold(
        (l) => emitFailure(failureResponse: l.toString()),
        (r) async {
          await AuthUtils.storeUser(r);
          await AuthUtils.storeToken(r);

          emitSuccess();
        },
      );
    } catch (e) {
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
