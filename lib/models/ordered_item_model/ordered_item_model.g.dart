// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedItemModel _$OrderedItemModelFromJson(Map<String, dynamic> json) =>
    OrderedItemModel(
      itemId: json['itemId'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$OrderedItemModelToJson(OrderedItemModel instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'quantity': instance.quantity,
    };
