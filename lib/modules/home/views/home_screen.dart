import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/analytics_card.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/announcement_card.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/current_shift_card.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/next_shift_card.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/quick_action.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentShiftCard(),
            const SizedBox(height: 24),

            // Next Shift Card
            NextShiftCard(),
            const SizedBox(height: 24),

            // Quick Actions
            Text(
              "Quick Actions",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                QuickAction(icon: Icons.done_all, label: "Accept Shift"),
                QuickAction(icon: Icons.calendar_month, label: "View Shifts"),
              ],
            ),
            const SizedBox(height: 24),

            // Analytics
            Text(
              "Analytics",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Column(
              children: const [
                AnalyticsCard(
                  icon: Icons.schedule,
                  label: "Current Hours Worked",
                  value: "20 hrs",
                ),
                SizedBox(height: 12),

                AnalyticsCard(
                  icon: Icons.schedule,
                  label: "Total Hours Worked",
                  value: "120 hrs",
                ),
                SizedBox(height: 12),
                AnalyticsCard(
                  icon: Icons.checklist,
                  label: "Completed Shifts",
                  value: "15",
                ),
                SizedBox(height: 12),
                AnalyticsCard(
                  icon: Icons.paid,
                  label: "Earnings Summary",
                  value: "\$2,400.00",
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Announcements
            Text(
              "Recent Announcements",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            const AnnouncementCard(
              icon: Icons.campaign,
              title: "Shift Scheduling Update",
              description:
                  "Important update regarding shift scheduling. Please check your emails.",
            ),
            SizedBox(height: 12),
            const AnnouncementCard(
              icon: Icons.model_training,
              title: "New Training Module",
              description:
                  "A new training module is now available for all staff members.",
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildHomeAppBar() {
    return AppBar(
      backgroundColor: AppColors.secondaryBackground,
      foregroundColor: AppColors.neutral900,
      centerTitle: false,

      actionsPadding: EdgeInsets.only(right: 18),
      leadingWidth: 60,
      leading: Padding(
        padding: EdgeInsetsGeometry.only(left: 20),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.accentColor,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(200),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CustomNetworkImage(
                imageUrl:
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuDZga5NOkeeb_lJrH6choaCqEVOZP-PVOhkbRvKbJXwKas9W6V3-IV266HmcmR50cWEnblTtOAbNJ47VqisLLoe2NwFVZXjdD33tIRwiu7y38M_94ijlP6zntR_E6pKPYSwlBc3WPxZAxkq1wvyS-TA4CQ7aGL-j1TxLqSNBWWIFFVkB0-4ZvGtuuQ5JTJjsnDjMFjhPizfBsMvZWsVYwEO29A37spnntK8eolLKwszP-3LR0ngRT_fTd2jMEh5e3zEThoZse6tIVPz",
              ),
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back,",
            style: TextStyle(color: AppColors.neutral500, fontSize: 12),
          ),
          Text(
            "Sarah",
            style: TextStyle(
              color: AppColors.neutral900,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            Icon(Icons.notifications, color: AppColors.neutral700, size: 28),
            Positioned(
              right: 0,
              top: 2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}






// ShiftItemWidget(
//             shift: ShiftItem(
//               role: "Registered Nurse",
//               title: "Shift at Woodford Hospital",
//               startDateAndTime: DateTime.now(),
//               endDateAndTime: DateTime.now().add(Duration(hours: 8)),
//               notes: "Please arrive 15 minutes early.",
//               location: Location(
//                 latitude: 51.4636868,
//                 longitude: -2.5686716,
//                 address: "29 Eve Road, Bristol, BS5 0JX",
//               ),
//               ratePerHour: "£20/hr",
//             ),
//           ),