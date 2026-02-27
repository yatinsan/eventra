import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
                }),
                icon: const Icon(Icons.chevron_left),
              ),
              Column(
                children: [
                  Text(
                    DateFormat('MMMM').format(_focusedDay),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(_focusedDay.year.toString()),
                ],
              ),
              IconButton(
                onPressed: () => setState(() {
                  _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
                }),
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                .map((day) => SizedBox(
                      width: 32,
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const Gap(8),
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
              final isSelected = _selectedDay != null &&
                  day.day == _selectedDay!.day &&
                  day.month == _selectedDay!.month;
              final isCurrentMonth = day.month == _focusedDay.month;

              return GestureDetector(
                onTap: () => setState(() => _selectedDay = day),
                child: Container(
                  decoration: isSelected
                      ? BoxDecoration(
                          color: const Color(0xFF7C4DFF),
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
                              : (isCurrentMonth ? Colors.black : Colors.grey),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
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
