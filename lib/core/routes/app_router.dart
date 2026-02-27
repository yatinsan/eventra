import 'package:events/core/constants/app_routes.dart';
import 'package:events/features/auth/views/create_password_screen.dart';
import 'package:events/features/auth/views/login_screen.dart';
import 'package:events/features/auth/views/verify_otp_screen.dart';
import 'package:events/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.verifyOtp:
        return MaterialPageRoute(builder: (_) => const VerifyOtpScreen());
      case AppRoutes.createPassword:
        return MaterialPageRoute(builder: (_) => const CreatePasswordScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
