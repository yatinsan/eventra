import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:events/shared/widgets/field_title.dart';
import 'package:events/shared/widgets/overlay_circle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  const AddTransactionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
              Gap(8),
              Expanded(
                child: Text("New Transaction", style: AppTextStyle.titleText),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  visualDensity: VisualDensity(vertical: -2),
                ),
                onPressed: () async {
                  showCircle(context);
                  await Future.delayed(Duration(milliseconds: 600));
                  removeCircle();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text("Done"),
              ),
              Gap(16),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Balance Due", style: AppTextStyle.body),
                  Text("₹64,000"),
                ],
              ),
              Gap(8),
              Divider(color: AppColors.gray200),
              Gap(8),
              FieldTitle("Title"),
              Gap(8),
              TextField(
                decoration: InputDecoration(hintText: "Name The Transaction"),
              ),
              Gap(16),
              FieldTitle("Amount", isRequired: true),
              Gap(8),
              TextField(
                decoration: InputDecoration(hintText: "Name The Transaction"),
              ),
              Gap(16),
            ],
          ),
        ),
      ],
    );
  }
}
