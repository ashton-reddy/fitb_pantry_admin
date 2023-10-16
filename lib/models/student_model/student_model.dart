import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel {
  @JsonKey()
  String email;

  @JsonKey()
  String firstName;

  @JsonKey()
  String lastName;

  @JsonKey()
  String phoneNumber;

  @JsonKey()
  String school;

  StudentModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.school,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return _$StudentModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StudentModelToJson(this);
  }
}
