import 'package:events/config/theme/app_colors.dart';
import 'package:events/shared/widgets/field_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldTitle("Business"),
          Gap(6),
          TextField(decoration: InputDecoration(hintText: "Enter Venue name")),
          Gap(12),
          FieldTitle("Business type"),
          Gap(6),
          DropdownButtonHideUnderline(
            child: DropdownMenu(
              width: double.maxFinite,

              dropdownMenuEntries: [
                "Auditorium",
              ].map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            ),
          ),
          // TextField(decoration: InputDecoration(hintText: "Auditorium")),
          Gap(12),
          FieldTitle("Phone"),
          Gap(6),
          TextField(decoration: InputDecoration(hintText: "999 999 9999")),
          Divider(height: 60),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text("Next"),
            ),
          ),
          Gap(24),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Already Have Account?",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: " Login Now",
                    style: TextStyle(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      DefaultTabController.of(context).animateTo(0);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
