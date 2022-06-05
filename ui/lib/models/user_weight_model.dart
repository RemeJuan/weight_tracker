import 'package:freezed_annotation/freezed_annotation.dart';

part "user_weight_model.freezed.dart";
part "user_weight_model.g.dart";

@freezed
class UserWeightModel with _$UserWeightModel {
  const UserWeightModel._();

  const factory UserWeightModel({
    required num weight,
    required String id,
    required String userId,
    required String created,
  }) = _UserWeightModel;

  factory UserWeightModel.empty() => const UserWeightModel(
        weight: 0,
        id: '',
        userId: '',
        created: '',
      );

  factory UserWeightModel.fromJson(Map<String, dynamic> json) =>
      _$UserWeightModelFromJson(json);
}
