import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(24),
        Text("Arun Kumar", style: AppTextStyle.titleText),
        Gap(8),
        Row(
          children: [
            Text("Friday", style: AppTextStyle.body),
            Gap(4),
            Icon(Icons.circle, size: 8, color: AppColors.gray500),
            Gap(4),
            Text("16 Mar 2026", style: AppTextStyle.body),
          ],
        ),
      ],
    );
  }
}
