import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/icons/password_lock.svg",
            width: 20,
            height: 20,
          ),
        ),
        hintText: "Enter Password",
      ),
    );
  }
}
