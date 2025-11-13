import 'dart:convert';

class UserRegisterDto{
  final String firstName;
  final String lastName;
  final List<int> roleIds;

  UserRegisterDto({
    required this.firstName,
    required this.lastName,
    required this.roleIds});

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'roleIds': roleIds,
  };
  String toJsonString() => jsonEncode(toJson());

}