import 'package:freezed_annotation/freezed_annotation.dart';

part "user_model.freezed.dart";
part "user_model.g.dart";

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String username,
    required String password,
    // Will only return for user login/signup success
    @JsonKey(name: "_id") String? id,
    String? token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
