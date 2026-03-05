import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notes", style: AppTextStyle.body),
        const Gap(8),
        Text(
          "Join us for an exciting event filled with engaging activities and networking opportunities. Don't miss out on the fun!",
          style: AppTextStyle.body.copyWith(color: AppColors.gray600),
        ),
      ],
    );
  }
}
