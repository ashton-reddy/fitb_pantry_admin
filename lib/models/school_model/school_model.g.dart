// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) => SchoolModel(
      closeDate: json['close date'] as int,
      isActive: json['is active'] as bool,
      name: json['name'] as String,
      openDate: json['open date'] as int,
    );

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'close date': instance.closeDate,
      'is active': instance.isActive,
      'name': instance.name,
      'open date': instance.openDate,
    };
