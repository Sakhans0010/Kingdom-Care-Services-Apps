import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/date_timeline.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/shift_item_widget.dart';

class AvailableShifts extends StatelessWidget {
  const AvailableShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateTimeline(),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Example item count
            itemBuilder: (context, index) {
              return ShiftItemWidget(
                shift: ShiftItem(
                  role: "Registered Nurse",
                  title: "Shift at Woodford Hospital",
                  date: DateTime.now(),
                  time: "9:00 AM - 5:00 PM",
                  location: "39 Eve Road, Bristol, BS5 0JX",
                  ratePerHour: "£20/hr",
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
