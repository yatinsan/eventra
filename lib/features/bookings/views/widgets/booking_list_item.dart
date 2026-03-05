import 'package:events/config/theme/app_colors.dart';
import 'package:events/core/constants/app_routes.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.eventDetailsScreen);
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        // color: AppColors.gray500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(4),
                    if (endTime.isNotEmpty) ...[
                      Expanded(
                        child: CustomPaint(painter: DottedLinePainter()),
                      ),
                      Gap(4),
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
            ),
            Gap(12),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
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
                      ),
                    ),
                    Gap(4),
                    Text(details),
                  ],
                ),
              ),
            ),
          ],
        ),
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
