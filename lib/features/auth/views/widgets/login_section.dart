import 'package:events/config/theme/app_colors.dart';
import 'package:events/core/constants/app_routes.dart';
import 'package:events/core/constants/app_strings.dart';
import 'package:events/shared/widgets/field_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'password_field.dart';
import 'remember_me.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(AppRoutes.verifyOtp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FieldTitle(AppStrings.phone),
            const Gap(8),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: AppStrings.phoneHint),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.phoneRequired;
                }
                if (value.length < 10) {
                  return AppStrings.invalidPhone;
                }
                return null;
              },
            ),
            const Gap(16),
            const FieldTitle(AppStrings.password),
            const Gap(8),
            const PasswordField(),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RememberMeCheckBox(),
                Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            const Divider(height: 60),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: _onLoginPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(AppStrings.login),
              ),
            ),
            const Gap(24),
            Center(
              child: RichText(
                text: TextSpan(
                  text: AppStrings.dontHaveAccount,
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: AppStrings.registerNow,
                      style: TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          DefaultTabController.of(context).animateTo(1);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
