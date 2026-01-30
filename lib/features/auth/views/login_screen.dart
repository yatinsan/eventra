import 'package:events/shared/app_bg_gradient.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBgGradient(
        child: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Eventra"),
                Text("Vendor"),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
