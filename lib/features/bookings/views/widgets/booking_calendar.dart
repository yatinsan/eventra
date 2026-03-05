import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/app_colors.dart';

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({super.key});

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime _focusedDay = DateTime(2026, 3, 1);
  DateTime? _selectedDay;

  List<DateTime> _daysInMonth(DateTime month) {
    final first = DateTime(month.year, month.month, 1);
    final daysBefore = (first.weekday - 1) % 7;
    final firstToDisplay = first.subtract(Duration(days: daysBefore));

    return List.generate(35, (i) => firstToDisplay.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final days = _daysInMonth(_focusedDay);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(70),
        border: Border.all(color: Colors.white, width: 3),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => setState(() {
                  _focusedDay = DateTime(
                    _focusedDay.year,
                    _focusedDay.month - 1,
                  );
                }),
                icon: const Icon(Icons.chevron_left),
              ),
              Column(
                children: [
                  Text(
                    DateFormat('MMMM').format(_focusedDay),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(_focusedDay.year.toString()),
                ],
              ),
              IconButton(
                onPressed: () => setState(() {
                  _focusedDay = DateTime(
                    _focusedDay.year,
                    _focusedDay.month + 1,
                  );
                }),
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(08),
                  blurRadius: 20,
                  offset: const Offset(0, 12),
                ),
              ],
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                  .map(
                    (day) => SizedBox(
                      width: 32,
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.gray500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisExtent: 48,
            ),
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];
              final isSelected =
                  _selectedDay != null &&
                  day.day == _selectedDay!.day &&
                  day.month == _selectedDay!.month;
              final isCurrentMonth = day.month == _focusedDay.month;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => _selectedDay = day),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: isSelected
                        ? BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(8),
                          )
                        : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.day.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected
                                ? Colors.white
                                : (isCurrentMonth
                                      ? AppColors.gray500
                                      : Colors.grey),
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),

                        Gap(4),
                        EventsCountDot(count: Random().nextInt(3)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EventsCountDot extends StatelessWidget {
  const EventsCountDot({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (index) => Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 1),
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.gray300,
            ),
          ),
        ),
      ),
    );
  }
}
