import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUsableTextField extends StatelessWidget {
  const ReUsableTextField({
    super.key,
    required this.controller,
    required this.text,
    this.icon,
    required this.obscure
  });

  final TextEditingController controller;
  final String text;
  final Widget? icon;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.lightBlueAccent,
            prefixIcon: icon,
            contentPadding: const EdgeInsets.only(right: 48, left: 16, top: 12, bottom: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none
            ),
            hint: Center(child: Text(text,style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0)),
            ),
          ),
        ));
  }
}