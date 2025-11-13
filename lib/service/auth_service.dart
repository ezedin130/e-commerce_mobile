import 'package:e_commerce/core/api_client.dart';
import '../model/auth_response_dto.dart';
import '../model/user_login_dto.dart';

class AuthService {
  Future<AuthResponseDto?> login(UserLoginDto dto) async {
    try {
      final response = await ApiClient.post('/user/login', dto.toJsonString());

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
}
