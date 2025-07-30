import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';

class DateTimeline extends StatefulWidget {
  @override
  _DateTimelineState createState() => _DateTimelineState();
}

class _DateTimelineState extends State<DateTimeline> {
  DateTime selectedDate = DateTime.now();

  List<DateTime> getDates() {
    DateTime today = DateTime.now();
    return List.generate(7, (index) => today.add(Duration(days: index)));
  }

  String getSingleLetterDay(DateTime date) {
    return DateFormat.E().format(date).substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = getDates();

    return SizedBox(
      height: 100,
      child: Row(
        children: dates.map((date) {
          bool isSelected =
              selectedDate.year == date.year &&
              selectedDate.month == date.month &&
              selectedDate.day == date.day;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryContainerColor : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getSingleLetterDay(date),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: isSelected
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : Colors.black.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
