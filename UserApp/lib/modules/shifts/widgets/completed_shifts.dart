import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/date_timeline.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/shifts_list_shimmer.dart';

class CompletedShifts extends StatelessWidget {
  const CompletedShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),

      child: Column(
        children: [
          DateTimeline(),
          SizedBox(height: 20),
          Expanded(child: ShiftsListShimmer()),
        ],
      ),
    );
  }
}
