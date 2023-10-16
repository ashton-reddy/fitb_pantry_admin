// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      label: json['label'] as String,
      image: json['image'] as String,
      group: json['group'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'label': instance.label,
      'image': instance.image,
      'group': instance.group,
      'id': instance.id,
    };
