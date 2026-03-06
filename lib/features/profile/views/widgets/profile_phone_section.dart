import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePhoneSection extends StatefulWidget {
  const ProfilePhoneSection({super.key});

  @override
  State<ProfilePhoneSection> createState() => _ProfilePhoneSectionState();
}

class _ProfilePhoneSectionState extends State<ProfilePhoneSection> {
  bool isCopySuccess = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("+91 888888888"),
        IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () async {
            Clipboard.setData(ClipboardData(text: "888888888"));
            setState(() {
              isCopySuccess = true;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Copied to clipboard")));

            await Future.delayed(Duration(seconds: 2));
            setState(() {
              isCopySuccess = false;
            });
          },
          icon: Icon(isCopySuccess ? Icons.check : Icons.copy, size: 14),
        ),
      ],
    );
  }
}
