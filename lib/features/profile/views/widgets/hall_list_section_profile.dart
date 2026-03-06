import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:events/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HallListSectionProfile extends StatelessWidget {
  const HallListSectionProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Complete Your Profile", style: AppTextStyle.titleText),
        Gap(16),
        HallListTile(hallName: "Main Hall"),
        Gap(16),
        SizedBox(
          width: double.maxFinite,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.gray400),
              ),

              onPressed: () {}, child: Text("Add New Hall")),
        ),
      ],
    );
  }
}

class HallListTile extends StatelessWidget {
  const HallListTile({super.key, required this.hallName});

  final String hallName;

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
          Assets.icons.icHallProfile.svg(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hallName, style: AppTextStyle.bodyLarge),
                Gap(4),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withAlpha(100),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text("Slots : 3"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_outlined, color: AppColors.gray400),
        ],
      ),
    );
  }
}
