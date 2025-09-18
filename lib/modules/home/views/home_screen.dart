import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/analytics_card.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/announcement_card.dart';
import 'package:kingdom_care_services_app/modules/home/widgets/quick_action.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        HomeHeaderWidget(),
        // Main Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Next Shift Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: .3),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Next Shift",
                            style: TextStyle(
                              color: AppColors.secondaryBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: AppColors.secondaryBackground,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "July 22, 2024, 9:00 AM",
                                  style: TextStyle(
                                    color: AppColors.secondaryBackground,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: AppColors.secondaryBackground,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "123 Main Street, Anytown",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBackground.withValues(
                                alpha: .2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.medical_services,
                              color: AppColors.secondaryBackground,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Quick Actions
                Text(
                  "Quick Actions",
                  style: TextStyle(
                    color: AppColors.neutral900,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
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
                    QuickAction(
                      icon: Icons.calendar_month,
                      label: "View Shifts",
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Analytics
                Text(
                  "Analytics",
                  style: TextStyle(
                    color: AppColors.neutral900,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  children: const [
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
                  style: TextStyle(
                    color: AppColors.neutral900,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
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
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDZga5NOkeeb_lJrH6choaCqEVOZP-PVOhkbRvKbJXwKas9W6V3-IV266HmcmR50cWEnblTtOAbNJ47VqisLLoe2NwFVZXjdD33tIRwiu7y38M_94ijlP6zntR_E6pKPYSwlBc3WPxZAxkq1wvyS-TA4CQ7aGL-j1TxLqSNBWWIFFVkB0-4ZvGtuuQ5JTJjsnDjMFjhPizfBsMvZWsVYwEO29A37spnntK8eolLKwszP-3LR0ngRT_fTd2jMEh5e3zEThoZse6tIVPz",
                ),
              ),
              const SizedBox(width: 12),
              Column(
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
            ],
          ),
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
      ),
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