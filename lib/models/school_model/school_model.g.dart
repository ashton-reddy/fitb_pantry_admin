// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) => SchoolModel(
      closeDate: (json['Close date'] as num).toInt(),
      isActive: json['Is active'] as bool,
      name: json['Name'] as String,
      openDate: (json['Open date'] as num).toInt(),
      email: json['Email'] as String,
    );

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'Close date': instance.closeDate,
      'Is active': instance.isActive,
      'Name': instance.name,
      'Open date': instance.openDate,
      'Email': instance.email,
    };
