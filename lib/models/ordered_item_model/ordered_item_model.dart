import 'package:json_annotation/json_annotation.dart';

part 'ordered_item_model.g.dart';

@JsonSerializable()
class OrderedItemModel {
  @JsonKey()
  String itemId;

  @JsonKey()
  int quantity;

  OrderedItemModel({
    required this.itemId,
    required this.quantity,
  });

  factory OrderedItemModel.fromJson(Map<String, dynamic> json) {
    return _$OrderedItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderedItemModelToJson(this);
  }
}