import 'package:e_commerce/pages/auth/register_page.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/reusable_textfield.dart';
import '../../model/user_login_dto.dart';
import '../../util/snackbar.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();
  void handleLogin(BuildContext context) async {
    final dto = UserLoginDto(
      userName: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    final response = await authService.login(dto);

    if (response != null) {
      showSnackBar(context, "Welcome ${response.username}!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      showSnackBar(context, "Invalid username or password");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            'WELCOME',
            style: GoogleFonts.lato(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Login Now!',
            style: GoogleFonts.lato(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ReUsableTextField(
            controller: usernameController,
            text: "username",
            icon: Icon(Icons.person,color: Colors.black,),
            obscure: false,
          ),
          const SizedBox(
            height: 15.0,
          ),
          ReUsableTextField(
            controller: passwordController,
            text: "password",
            icon: Icon(Icons.password,color: Colors.black,),
            obscure: true,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4EB3E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 3,
                ),
                onPressed: (){
                  handleLogin(context);
                },
                child: Text('Login',style: GoogleFonts.lato(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: GoogleFonts.lato(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                child: Text(
                  'Register now',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

