import 'package:events/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingListItem extends StatelessWidget {
  final String time;
  final String endTime;
  final String title;
  final String details;
  final bool isLast;

  const BookingListItem({
    super.key,
    required this.time,
    this.endTime = "",
    required this.title,
    required this.details,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    // color: AppColors.gray500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (endTime.isNotEmpty) ...[
                  Spacer(),
                  Text(
                    endTime,
                    style: TextStyle(
                      fontSize: 12,
                      // color: AppColors.gray500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Gap(12),
          Column(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  // color: AppColors.gray300,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(child: CustomPaint(painter: DottedLinePainter())),
              if (endTime.isNotEmpty)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    // color: AppColors.gray300,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          Gap(12),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF2F6FF), // Light blueish bg
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      // color: AppColors.textPrimary,
                    ),
                  ),
                  Gap(4),
                  Text(
                    details,
                    // style: TextStyle(fontSize: 14, color: AppColors.gray500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gray200
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + 4), paint);
      startY += 8;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
