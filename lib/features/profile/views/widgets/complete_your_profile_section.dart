import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:events/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompleteYourProfileSection extends StatelessWidget {
  const CompleteYourProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Complete Your Profile", style: AppTextStyle.titleText),
        Gap(16),
        CompleteProfileItemTile(
          icon: Assets.icons.icLocationProfile.svg(),
          title: "Add Your Venue Location",
          subtitle: "Add Your Venue Location",
        ),
        Gap(8),
        CompleteProfileItemTile(
          icon: Assets.icons.icHallProfile.svg(),
          title: "Configure Your Hall",
          subtitle: "Add Halls, configure slots ect",
        ),
      ],
    );
  }
}

class CompleteProfileItemTile extends StatelessWidget {
  const CompleteProfileItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final Widget icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray200, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 16,
        children: [
          icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.bodyLarge),
                Text(subtitle),
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity(vertical: -2),
              side: BorderSide(color: AppColors.gray400),
            ),
            onPressed: () {},
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
