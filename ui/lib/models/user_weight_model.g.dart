// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_weight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserWeightModel _$$_UserWeightModelFromJson(Map<String, dynamic> json) =>
    _$_UserWeightModel(
      weight: json['weight'] as int,
      id: json['id'] as String,
      userId: json['userId'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$$_UserWeightModelToJson(_$_UserWeightModel instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'userId': instance.userId,
      'created': instance.created,
    };
