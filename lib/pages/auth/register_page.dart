import 'package:e_commerce/pages/auth/login_page.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/reusable_textfield.dart';
import '../../model/user_register_dto.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
   final authService = AuthService();
   final firstNameController = TextEditingController();
   final lastNameController = TextEditingController();
   void handleRegister(BuildContext context) async {
     final dto = UserRegisterDto(
       firstName: firstNameController.text.trim(),
       lastName: lastNameController.text.trim(),
       roleIds: [4]
     );

     final response = await authService.register(dto);

     if (response != null) {
       showDialog(
         context: context,
         barrierDismissible: false,
         builder: (_) => AlertDialog(
           title: Text('Your Account Details'),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text('Username: ${response.userName}'),
               Text('Password: ${response.userName}123'),
               SizedBox(height: 10),
               Text(
                 'Please change your password after login.',
                 style: TextStyle(fontSize: 12, color: Colors.grey[700]),
               ),
             ],
           ),
           actions: [
             TextButton(
               onPressed: () {
                 Navigator.pop(context);
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (_) => LoginPage()),
                 );
               },
               child: Text('OK'),
             ),
           ],
         ),
       );
     }

     else {
       ScaffoldMessenger.of(context)
           .showSnackBar(SnackBar(content: Text('Registration failed')));
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
            controller: firstNameController,
            text: "first name",
            obscure: false,
          ),
          const SizedBox(
            height: 15.0,
          ),
          ReUsableTextField(
            controller: lastNameController,
            text: "last name",
            obscure: false,
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
                  handleRegister(context);
                },
                child: Text('Register',style: GoogleFonts.lato(
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
                'Already a member?',
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
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'Login now',
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
