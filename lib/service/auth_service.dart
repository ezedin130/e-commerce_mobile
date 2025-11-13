import 'package:e_commerce/core/api_client.dart';
import 'package:e_commerce/model/register_response.dart';
import '../model/auth_response_dto.dart';
import '../model/user_register_dto.dart';
import '../model/user_login_dto.dart';

class AuthService {
  Future<AuthResponseDto?> login(UserLoginDto dto) async {
    try {
      final response = await ApiClient.login('/user/login', dto.toJsonString());

      if (response.statusCode == 200) {
        return AuthResponseDto.fromJsonString(response.body);
      } else {
        print('Login failed: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  Future<RegisterResponse?> register(UserRegisterDto dto) async {
    try {
      final response = await ApiClient.register('/user/create-user', dto.toJsonString());
      if (response.statusCode == 200) {
        return RegisterResponse.fromJsonString(response.body);
      } else {
        print('Registration failed: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
