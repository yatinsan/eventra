import 'package:events/core/constants/app_routes.dart';
import 'package:events/core/routes/app_router.dart';
import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'core/constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}
