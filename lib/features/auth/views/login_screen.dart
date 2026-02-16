import 'package:events/config/theme/app_colors.dart';
import 'package:events/features/auth/views/widgets/login_register_tab.dart';
import 'package:events/features/auth/views/widgets/logo_text.dart';
import 'package:events/features/auth/views/widgets/password_field.dart';
import 'package:events/shared/app_bg_gradient.dart';
import 'package:events/shared/widgets/field_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/remember_me.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBgGradient(
        child: SafeArea(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(32),
                LogoText(),
                Gap(16),
                LoginRegisterTab(),
                Gap(16),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldTitle("Phone"),
                      Gap(8),
                      TextField(
                        decoration: InputDecoration(hintText: "999 999 9999"),
                      ),
                      Gap(16),
                      FieldTitle("Password"),
                      Gap(8),
                      PasswordField(),
                      Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RememberMeCheckBox(),
                          Text(
                            "Forgot Your password?",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                      Divider(height: 60),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text("Login"),
                        ),
                      ),
                      Gap(24),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don’t have an account?",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: " Register Now",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => "",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
