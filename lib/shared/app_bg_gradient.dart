import 'package:flutter/material.dart';

class AppBgGradient extends StatelessWidget {
  const AppBgGradient({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentGeometry.topCenter,
          child: Image.asset(
            "assets/images/app_bg_gradient.png",
            width: double.maxFinite,
            fit: BoxFit.fitWidth,
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
