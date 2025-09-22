import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';

class NextShiftCard extends StatelessWidget {
  const NextShiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.shiftDetailsScreen,
          arguments: ShiftItem(
            role: "Registered Nurse",
            title: "Shift at Woodford Hospital",
            startDateAndTime: DateTime.now(),
            endDateAndTime: DateTime.now().add(Duration(hours: 8)),
            notes: "Please arrive 15 minutes early.",
            location: Location(
              latitude: 51.4636868,
              longitude: -2.5686716,
              address: "29 Eve Road, Bristol, BS5 0JX",
            ),
            ratePerHour: "£20/hr",
          ),
        );
      },
      child: Container(
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
              children: [
                Text(
                  "Next Shift",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.secondaryBackground,
                  ),
                ),
                const Icon(
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
                    children: [
                      Text(
                        "July 22, 2024, 9:00 AM",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.secondaryBackground,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: AppColors.secondaryBackground,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "123 Main Street, Anytown",
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: AppColors.grey,
                                  fontSize: 13.5,
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
                    color: AppColors.secondaryBackground.withValues(alpha: .2),
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
    );
  }
}
