import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:events/features/profile/views/widgets/profile_phone_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              "SampleImages.profileImage",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                child: Icon(Icons.person, size: 70, color: Colors.white54),
              ),
            ),
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shikkari Auditorium", style: AppTextStyle.titleText),
                ProfilePhoneSection(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("Auditorium "),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
