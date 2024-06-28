import 'package:json_annotation/json_annotation.dart';

part 'school_model.g.dart';

@JsonSerializable()
class SchoolModel {
  @JsonKey(name: 'close date')
  int closeDate;

  @JsonKey(name: 'is active')
  bool isActive;

  @JsonKey()
  String name;

  @JsonKey(name: 'open date')
  int openDate;

  @JsonKey()
  String email;

  SchoolModel(
      {required this.closeDate,
      required this.isActive,
      required this.name,
      required this.openDate,
      required this.email});

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return _$SchoolModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SchoolModelToJson(this);
  }
}
