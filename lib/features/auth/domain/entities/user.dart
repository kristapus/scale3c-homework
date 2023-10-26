import 'package:json_annotation/json_annotation.dart';

class User {
  final String id;
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;
  final String? phone;

  @JsonKey(name: 'completed_projects')
  final int? completedProjects;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.completedProjects,
  });
}
