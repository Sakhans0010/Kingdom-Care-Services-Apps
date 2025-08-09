import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/app_utils/app_images.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/date_timeline.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/profile_section_widget.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/section_title_row.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/user_current_shifts.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/shift_item_widget.dart';

import '../../../widgets/shift_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              ProfileSectionWidget(),
              Spacer(),
              IconButton(
            icon: Image.asset(
              AppImages.NOTIFICATION_BELL,
              width: 30,
              height: 30,
            ),
            onPressed: () {
              // Handle notifications action
            },
          ),
            ],
          ),
          SizedBox(height: 20),
          SectionTitleRow(
            title: "Your Shifts",
            number: "19",
            onViewAllPressed: () {
              // Handle view all shifts action
            },
          ),
          SizedBox(height: 15),
          UserCurrentShifts(),

          SizedBox(height: 15),
          SectionTitleRow(
            title: "Available Shifts",
            number: "123",
            onViewAllPressed: () {
              // Handle view all Available shifts action
            },
          ),
          SizedBox(height: 10),

          DateTimeline(isHomeScreen: true),
          SizedBox(height: 20),
          ShiftItemWidget(
            shift: ShiftItem(
              role: "Registered Nurse",
              title: "Shift at Woodford Hospital",
              date: DateTime.now(),
              time: "9:00 AM - 5:00 PM",
              location: "39 Eve Road, Bristol, BS5 0JX",
              ratePerHour: "£20/hr",
            ),
          ),
          ShiftItemWidget(
            shift: ShiftItem(
              role: "Registered Nurse",
              title: "Shift at Woodford Hospital",
              date: DateTime.now(),
              time: "9:00 AM - 5:00 PM",
              location: "39 Eve Road, Bristol, BS5 0JX",
              ratePerHour: "£20/hr",
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
