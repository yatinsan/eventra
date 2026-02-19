import 'package:events/config/theme/app_colors.dart';
import 'package:events/features/auth/views/widgets/logo_text.dart';
import 'package:events/features/auth/views/widgets/password_field.dart';
import 'package:events/shared/app_bg_gradient.dart';
import 'package:events/shared/widgets/field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBgGradient(
        child: SafeArea(
          child: Column(
            children: [
              Gap(24),
              LogoText(),
              Gap(24),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/password_lock.svg", height: 24, width: 24,),
              ),
              Gap(24),
              Text(
                "Create Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Set a Strong password to secure your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitle("Create Password"),
                    Gap(8),
                    PasswordField(hintText: "Enter Password"),
                    Gap(16),
                    FieldTitle("Confirm Password"),
                    Gap(8),
                    PasswordField(hintText: "Re Enter Password"),
                    Gap(24),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text("Confirm"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
