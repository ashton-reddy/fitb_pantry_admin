// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) => SchoolModel(
      closeDate: (json['close date'] as num).toInt(),
      isActive: json['is active'] as bool,
      name: json['name'] as String,
      openDate: (json['open date'] as num).toInt(),
      email: json['email'] as String,
    );

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'close date': instance.closeDate,
      'is active': instance.isActive,
      'name': instance.name,
      'open date': instance.openDate,
      'email': instance.email,
    };
