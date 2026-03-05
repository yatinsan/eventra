import 'package:events/core/constants/app_routes.dart';
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
              const Gap(24),
              const LogoText(),
              const Gap(24),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/password_lock.svg", height: 24, width: 24,),
              ),
              const Gap(24),
              const Text(
                "Create Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Set a Strong password to secure your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldTitle("Create Password"),
                    const Gap(8),
                    const PasswordField(hintText: "Enter Password"),
                    const Gap(16),
                    const FieldTitle("Confirm Password"),
                    const Gap(8),
                    const PasswordField(hintText: "Re Enter Password"),
                    const Gap(24),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.home);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text("Confirm"),
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
