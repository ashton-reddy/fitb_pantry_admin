import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  @JsonKey()
  String label;

  @JsonKey()
  String image;

  @JsonKey()
  String group;

  @JsonKey()
  String id;

  ItemModel({
    required this.label,
    required this.image,
    required this.group,
    required this.id,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return _$ItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemModelToJson(this);
  }
}
