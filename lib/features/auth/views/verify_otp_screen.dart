import 'package:events/config/theme/app_colors.dart';
import 'package:events/core/constants/app_routes.dart';
import 'package:events/features/auth/views/widgets/logo_text.dart';
import 'package:events/features/auth/views/widgets/otp_field.dart';
import 'package:events/shared/app_bg_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
                child: SvgPicture.asset("assets/icons/shield_tick.svg"),
              ),
              const Gap(24),
              const Text(
                "Verify account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Gap(12),
              const Text(
                "Please enter the 4-digit OTP sent to ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Text(
                "+91 88888 88888.",
                style: TextStyle(
                  color: Color(0xFF205EFB),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(24),
              Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: OTPField(length: 4, controller: TextEditingController()),
              ),
              const Gap(14),
              Text.rich(
                TextSpan(
                  text: "Resend OTP",
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: AppColors.gray200,
                ),
              ),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.createPassword);

              }, child: const Text("Verify")),
            ],
          ),
        ),
      ),
    );
  }
}
