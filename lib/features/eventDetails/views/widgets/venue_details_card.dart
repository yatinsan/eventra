import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VenueDetailsCard extends StatelessWidget {
  const VenueDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hall",
                style: AppTextStyle.body.copyWith(color: AppColors.gray500),
              ),
              Text("Main Hall", style: AppTextStyle.bodyLarge.copyWith()),
            ],
          ),
          const Gap(8),
          const Divider(color: AppColors.gray200),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Slot",
                style: AppTextStyle.body.copyWith(color: AppColors.gray500),
              ),
              Text("Morning, 9:00 AM - 3 Pm", style: AppTextStyle.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}
