import 'package:events/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginRegisterTab extends StatelessWidget {
  const LoginRegisterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(60),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 0,
          labelStyle: TextStyle(color: Colors.black),
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
          tabs: [
            Tab(text: "Login"),
            Tab(text: "Register"),
          ],
        ),
      ),
    );
  }
}
