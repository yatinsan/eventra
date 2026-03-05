import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AmountTile extends StatelessWidget {
  const AmountTile({
    super.key,
    required this.title,
    required this.amount,
    this.amountColor,
  });

  final String title;
  final String amount;
  final Color? amountColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppColors.gray400)),
          const Gap(10),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              amount,
              style: AppTextStyle.bodyLarge.copyWith(color: amountColor),
            ),
          ),
        ],
      ),
    );
  }
}
