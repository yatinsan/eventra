import 'package:events/features/bookings/views/widgets/booking_calendar.dart';
import 'package:events/features/bookings/views/widgets/booking_list_item.dart';
import 'package:events/shared/app_bg_gradient.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBgGradient(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bookings",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                const BookingCalendar(),
                const Gap(24),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Bookings",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Gap(16),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: const [
                          BookingListItem(
                            time: "9:00 Am",
                            endTime: "3:00 Pm",
                            title: "Arun Kumar",
                            details: "Main Hall • Slot : Morning",
                          ),
                          BookingListItem(
                            time: "10:00 Am",
                            endTime: "2:00 Pm",
                            title: "Vijay Lakshmi",
                            details: "Mini Hall • Slot : Custom",
                          ),
                          BookingListItem(
                            time: "4:00 Pm",
                            title: "Suresh",
                            details: "",
                            endTime: "5:00 pm",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookingsList extends StatelessWidget {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
