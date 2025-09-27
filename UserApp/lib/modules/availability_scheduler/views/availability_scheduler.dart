import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class AvailabilityScheduler extends StatefulWidget {
  const AvailabilityScheduler({super.key});

  @override
  State<AvailabilityScheduler> createState() => _AvailabilitySchedulerState();
}

class _AvailabilitySchedulerState extends State<AvailabilityScheduler> {
  DateTime currentMonth = DateTime.now();
  bool isCurrentMonth = true;
  Map<String, String> availability =
      {}; // key: date string, value: Morning/Evening/Night

  List<DateTime> getDatesInMonth(DateTime month) {
    final now = DateTime.now();
    final isCurrentMonth = month.year == now.year && month.month == now.month;

    final startDay = isCurrentMonth ? now.day : 1;
    final lastDay = DateTime(month.year, month.month + 1, 0);

    return List.generate(
      lastDay.day - startDay + 1,
      (index) => DateTime(month.year, month.month, startDay + index),
    );
  }

  void changeMonth(int offset) {
    final newMonth = DateTime(currentMonth.year, currentMonth.month + offset);

    final now = DateTime.now();
    final todayMonth = DateTime(now.year, now.month);

    setState(() {
      currentMonth = newMonth;
      isCurrentMonth =
          newMonth.year == todayMonth.year &&
          newMonth.month == todayMonth.month;
    });
  }

  Widget buildAvailabilityRow(DateTime date) {
    String dateKey = DateFormat('yyyy-MM-dd').format(date);
    String? selectedTime = availability[dateKey];

    Widget buildCircleOption(String value, String label) {
      bool isSelected = selectedTime == value;
      return GestureDetector(
        onTap: () {
          setState(() {
            availability[dateKey] = value;
          });
        },
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.white,
            shape: BoxShape.circle,

            border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              width: 2,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 3, child: Text(DateFormat('dd MMM').format(date))),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: buildCircleOption('Morning', 'M'),
              ),
            ),
            Expanded(
              flex: 5,

              child: Padding(
                padding: const EdgeInsets.only(right: 15),

                child: buildCircleOption('Evening', 'E'),
              ),
            ),
            Expanded(flex: 5, child: buildCircleOption('U/A', 'U')),
          ],
        ),
        SizedBox(height: 10),
        Divider(height: 1, thickness: 0.5, color: Colors.grey[300]),
      ],
    );
  }

  // Widget buildAvailabilityRow(DateTime date) {
  //   String dateKey = DateFormat('yyyy-MM-dd').format(date);
  //   String? selectedTime = availability[dateKey];

  //   return Row(
  //     children: [
  //       Expanded(child: Text(DateFormat('dd MMM').format(date))),
  //       Expanded(
  //         child:

  //         RadioListTile<String>(
  //           value: 'Morning',
  //           groupValue: selectedTime,
  //           title: const Text(''),
  //           onChanged: (value) {
  //             log("Selected Morning for $dateKey: $value: $selectedTime");
  //             setState(() {
  //               availability[dateKey] = value!;
  //             });
  //           },
  //         ),
  //       ),
  //       Expanded(
  //         child: RadioListTile<String>(
  //           value: 'Evening',
  //           groupValue: selectedTime,
  //           title: const Text(''),
  //           onChanged: (value) {
  //             setState(() {
  //               availability[dateKey] = value!;
  //             });
  //           },
  //         ),
  //       ),
  //       Expanded(
  //         child: RadioListTile<String>(
  //           value: 'U/A',
  //           groupValue: selectedTime,
  //           title: const Text(''),
  //           onChanged: (value) {
  //             setState(() {
  //               availability[dateKey] = value!;
  //             });
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final dates = getDatesInMonth(currentMonth);
    final monthLabel = DateFormat('MMMM yyyy').format(currentMonth);

    return Scaffold(
      // backgroundColor: AppColors.background,
      // appBar: AppBar(
      // backgroundColor: AppColors.background,

      //   elevation: 0,
      //   centerTitle: false,
      //   foregroundColor: Colors.black,

      //   title: Text(
      //     "Availability Scheduler",
      //     style: Theme.of(context).textTheme.titleMedium,
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            _buildUpperSection(monthLabel),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: dates.length,
                padding: EdgeInsets.only(left: 15),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: buildAvailabilityRow(dates[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildUpperSection(String monthLabel) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.16),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 10),
              Text(
                "Availability Scheduler",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashColor: isCurrentMonth ? Colors.transparent : null,
                highlightColor: isCurrentMonth ? Colors.transparent : null,
                icon: Icon(
                  Icons.arrow_back,
                  color: isCurrentMonth ? Colors.grey : Colors.black,
                ),
                onPressed: isCurrentMonth ? () {} : () => changeMonth(-1),
              ),
              Text(
                monthLabel,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => changeMonth(1),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: const Row(
              children: [
                Expanded(
                  flex: 4,

                  child: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    'Morning',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,

                  child: Text(
                    'Evening',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 6,

                  child: Align(
                    // alignment: Alignment.center,
                    child: Text(
                      'U/A',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
