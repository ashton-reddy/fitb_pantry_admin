import 'package:fitbadmin/models/ordered_item_model/ordered_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey()
  String studentId;

  @JsonKey()
  List<OrderedItemModel> items;

  OrderModel({
    required this.studentId,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}
