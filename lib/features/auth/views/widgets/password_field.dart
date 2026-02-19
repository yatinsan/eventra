import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.hintText = "Enter Password",
    this.controller,
  });

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true, // Assuming it should be obscure by default since it's a password field
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/icons/password_lock.svg",
            width: 20,
            height: 20,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
