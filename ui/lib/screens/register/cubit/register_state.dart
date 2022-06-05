import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_tracker/models/user_model.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState.loading() = RegisterLoading;

  const factory RegisterState.loaded(UserModel user) = RegisterLoaded;

  const factory RegisterState.error() = RegisterError;

  factory RegisterState.initial() => const RegisterState.loading();
}
