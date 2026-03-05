import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:events/features/eventDetails/views/widgets/amount_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentSummarySection extends StatelessWidget {
  const PaymentSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: AppColors.gray200),
        Text(
          "Payments & Transactions",
          style: AppTextStyle.bodyLarge.copyWith(color: AppColors.gray1000),
        ),
        const Gap(8),
        Row(
          children: [
            Expanded(
              child: AmountTile(
                title: "Total Amount",
                amount: "₹ 70,000",
                amountColor: Colors.black,
              ),
            ),
            const Gap(12),
            Expanded(
              child: AmountTile(
                title: "Balance Due",
                amount: "₹ 64,000",
                amountColor: Colors.red,
              ),
            ),
          ],
        ),
        const Gap(8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Paid",
                    style: AppTextStyle.bodyLarge.copyWith(
                      color: AppColors.gray400,
                    ),
                  ),
                  Text("₹4000", style: AppTextStyle.bodyLarge),
                ],
              ),
              const Gap(4),
              const Divider(color: AppColors.gray200),
              const Gap(4),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Advance",
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.gray600,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("2 Mar ", style: AppTextStyle.body),
                            const Gap(4),
                            const Icon(
                              Icons.circle,
                              size: 6,
                              color: AppColors.gray500,
                            ),
                            const Gap(4),
                            Text("3:00 PM", style: AppTextStyle.body),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "₹ 4000",
                        style: AppTextStyle.bodyLarge.copyWith(
                          color: AppColors.gray1000,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
