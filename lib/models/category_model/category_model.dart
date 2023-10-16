import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey()
  String name;

  @JsonKey()
  int totalLimit;

  CategoryModel({
    required this.name,
    required this.totalLimit,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }
}
