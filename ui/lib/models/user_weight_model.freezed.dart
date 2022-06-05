// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_weight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWeightModel _$UserWeightModelFromJson(Map<String, dynamic> json) {
  return _UserWeightModel.fromJson(json);
}

/// @nodoc
mixin _$UserWeightModel {
  num get weight => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWeightModelCopyWith<UserWeightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWeightModelCopyWith<$Res> {
  factory $UserWeightModelCopyWith(
          UserWeightModel value, $Res Function(UserWeightModel) then) =
      _$UserWeightModelCopyWithImpl<$Res>;
  $Res call({num weight, String id, String userId, String created});
}

/// @nodoc
class _$UserWeightModelCopyWithImpl<$Res>
    implements $UserWeightModelCopyWith<$Res> {
  _$UserWeightModelCopyWithImpl(this._value, this._then);

  final UserWeightModel _value;
  // ignore: unused_field
  final $Res Function(UserWeightModel) _then;

  @override
  $Res call({
    Object? weight = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserWeightModelCopyWith<$Res>
    implements $UserWeightModelCopyWith<$Res> {
  factory _$$_UserWeightModelCopyWith(
          _$_UserWeightModel value, $Res Function(_$_UserWeightModel) then) =
      __$$_UserWeightModelCopyWithImpl<$Res>;
  @override
  $Res call({num weight, String id, String userId, String created});
}

/// @nodoc
class __$$_UserWeightModelCopyWithImpl<$Res>
    extends _$UserWeightModelCopyWithImpl<$Res>
    implements _$$_UserWeightModelCopyWith<$Res> {
  __$$_UserWeightModelCopyWithImpl(
      _$_UserWeightModel _value, $Res Function(_$_UserWeightModel) _then)
      : super(_value, (v) => _then(v as _$_UserWeightModel));

  @override
  _$_UserWeightModel get _value => super._value as _$_UserWeightModel;

  @override
  $Res call({
    Object? weight = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? created = freezed,
  }) {
    return _then(_$_UserWeightModel(
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserWeightModel extends _UserWeightModel {
  const _$_UserWeightModel(
      {required this.weight,
      required this.id,
      required this.userId,
      required this.created})
      : super._();

  factory _$_UserWeightModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserWeightModelFromJson(json);

  @override
  final num weight;
  @override
  final String id;
  @override
  final String userId;
  @override
  final String created;

  @override
  String toString() {
    return 'UserWeightModel(weight: $weight, id: $id, userId: $userId, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserWeightModel &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  _$$_UserWeightModelCopyWith<_$_UserWeightModel> get copyWith =>
      __$$_UserWeightModelCopyWithImpl<_$_UserWeightModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserWeightModelToJson(this);
  }
}

abstract class _UserWeightModel extends UserWeightModel {
  const factory _UserWeightModel(
      {required final num weight,
      required final String id,
      required final String userId,
      required final String created}) = _$_UserWeightModel;
  const _UserWeightModel._() : super._();

  factory _UserWeightModel.fromJson(Map<String, dynamic> json) =
      _$_UserWeightModel.fromJson;

  @override
  num get weight => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get created => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserWeightModelCopyWith<_$_UserWeightModel> get copyWith =>
      throw _privateConstructorUsedError;
}
