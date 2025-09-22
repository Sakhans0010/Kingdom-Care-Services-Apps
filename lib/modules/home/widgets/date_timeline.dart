import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class DateTimeline extends StatefulWidget {
  final bool isHomeScreen;
  const DateTimeline({super.key, this.isHomeScreen = false});
  @override
  _DateTimelineState createState() => _DateTimelineState();
}

class _DateTimelineState extends State<DateTimeline> {
  DateTime selectedDate = DateTime.now();

  List<DateTime> getDates() {
    DateTime today = DateTime.now();
    if (widget.isHomeScreen) {
      // Just next 7 days
      return List.generate(7, (index) => today.add(Duration(days: index)));
    } else {
      // Dates from today to the end of next month
      DateTime endOfNextMonth = DateTime(
        today.year,
        today.month + 2,
        0,
      ); // last day of next month
      List<DateTime> allDates = [];

      for (
        DateTime date = today;
        date.isBefore(endOfNextMonth.add(Duration(days: 1)));
        date = date.add(Duration(days: 1))
      ) {
        allDates.add(date);
      }

      return allDates;
    }
  }

  String getSingleLetterDay(DateTime date) {
    return DateFormat.E().format(date).substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = getDates();

    return SizedBox(
      height: 100,
      child: widget.isHomeScreen
          ? Row(
              children: dates.map((date) => buildDateItem(date, true)).toList(),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,

              itemBuilder: (context, index) {
                return buildDateItem(dates[index], false);
              },
            ),
    );

    SizedBox(
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

  Widget buildDateItem(DateTime date, bool isExpanded) {
    bool isSelected =
        selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;

    final content = GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.isHomeScreen ? 5 : 5),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: widget.isHomeScreen ? 60 : 50,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.23)
              : null,
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
                    ? AppColors.textpPrimaryColor
                    : Colors.black.withValues(alpha: .6),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.textpPrimaryColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );

    return isExpanded ? Expanded(child: content) : content;
  }
}
