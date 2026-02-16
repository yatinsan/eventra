import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    final line = Expanded(child: Divider(color: Colors.white));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Eventra", style: TextStyle(fontSize: 28, color: Colors.white)),
        Row(
          children: [
            line,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Vendor",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            line,
          ],
        ),
      ],
    );
  }
}
