import 'package:events/features/auth/views/widgets/login_register_tab.dart';
import 'package:events/features/auth/views/widgets/login_section.dart';
import 'package:events/features/auth/views/widgets/logo_text.dart';
import 'package:events/features/auth/views/widgets/register_section.dart';
import 'package:events/shared/app_bg_gradient.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBgGradient(
        child: SafeArea(
          child: SizedBox(
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(32),
                  LogoText(),
                  Gap(16),
                  LoginRegisterTab(),
                  Gap(16),
                  Expanded(
                    child: TabBarView(
                      children: [LoginSection(), RegisterSection()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
