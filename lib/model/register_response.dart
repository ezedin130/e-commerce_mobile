import 'dart:convert';

class RegisterResponse{
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final List<String> roleId;

  RegisterResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.roleId
  });
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        userName: json['userName'],
        password: json['password'],
        roleId: ['CUSTOMER']
    );
  }
  static RegisterResponse fromJsonString(String str) =>
      RegisterResponse.fromJson(jsonDecode(str));
  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'password': password,
    'roleId': roleId
  };

}