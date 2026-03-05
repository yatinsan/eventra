import 'package:events/config/theme/app_colors.dart';
import 'package:events/config/theme/app_text_styles.dart';
import 'package:events/shared/widgets/overlay_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EventDeleteDialog extends StatelessWidget {
  const EventDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(16),
          SvgPicture.asset('assets/icons/ic_delete_bg.svg'),
          Gap(8),

          Text("Delete Booking?", style: AppTextStyle.titleText),
          Gap(8),
          Text(
            "This booking and all associated payment records will be permanently deleted. This action cannot be undone.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide(color: AppColors.gray300),
          ),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            showCircle(context);

            await Future.delayed(Duration(milliseconds: 300));
            removeCircle();
            if (context.mounted) {
              Navigator.pop(context);
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Delete Booking"),
        ),
      ],
    );
  }
}
