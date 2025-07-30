import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/app_utils/app_images.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/date_timeline.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/section_title_row.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: AppColors.background,
                ),
              ),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: "Good Evening,\n",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //  height: 1.0,
                  ),
                  children: [
                    TextSpan(
                      text: "Jenny",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                var isOffDay = index == 1 ? true : false;
                return Container(
                  margin: const EdgeInsets.only(right: 17, bottom: 20),
                  width: isOffDay ? 130 : 180,
                  height: 260,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: isOffDay ? AppColors.grey : AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "23",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: isOffDay
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                              ),
                          children: [
                            TextSpan(
                              text: isOffDay ? "\nAll Day" : "  Today",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    fontSize: 18,
                                    color: isOffDay
                                        ? Colors.black38
                                        : AppColors.secondaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (!isOffDay)
                        Text(
                          "9:00 AM - 5:00 PM",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                        ),
                      Spacer(),

                      Text(
                        isOffDay ? "Free Day" : "Registered Nurse",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: isOffDay ? 24 : 20,
                          fontWeight: FontWeight.bold,
                          color: isOffDay
                              ? AppColors.primaryColor
                              : AppColors.secondaryColor,
                        ),
                      ),
                      SizedBox(height: isOffDay ? 20 : 5),
                      if (!isOffDay)
                        Text(
                          "Woodford Hospital",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                        ),
                      SizedBox(height: 5),
                    ],
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 15),
          SectionTitleRow(
            title: "Available Shifts",
            number: "123",
            onViewAllPressed: () {
              // Handle view all Available shifts action
            },
          ),
          SizedBox(height: 10),

          DateTimeline(),
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
