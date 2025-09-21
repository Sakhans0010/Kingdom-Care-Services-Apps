import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/main.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';

class ShiftItemCard extends StatelessWidget {
  final ShiftItem shift;

  const ShiftItemCard({super.key, required this.shift});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.shiftDetailsScreen,
          arguments: shift,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Top row: info + image
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Date
                // _buildDateContainer(),
                // const SizedBox(width: 12),
                // // Right: details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shift.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      _buildInfoSection(
                        icon: Icons.access_time,
                        infoText:
                            "${DateFormat.jm().format(shift.startDateAndTime)} - ${DateFormat.jm().format(shift.endDateAndTime)}",
                      ),
                      const SizedBox(height: 4),
                      _buildInfoSection(
                        icon: Icons.location_on_outlined,
                        infoText: shift.location.address,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Optional: placeholder for image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomNetworkImage(
                      imageUrl:
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuDZga5NOkeeb_lJrH6choaCqEVOZP-PVOhkbRvKbJXwKas9W6V3-IV266HmcmR50cWEnblTtOAbNJ47VqisLLoe2NwFVZXjdD33tIRwiu7y38M_94ijlP6zntR_E6pKPYSwlBc3WPxZAxkq1wvyS-TA4CQ7aGL-j1TxLqSNBWWIFFVkB0-4ZvGtuuQ5JTJjsnDjMFjhPizfBsMvZWsVYwEO29A37spnntK8eolLKwszP-3LR0ngRT_fTd2jMEh5e3zEThoZse6tIVPz",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Bottom row: rate + button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rate badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainerColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    shift.ratePerHour,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 14,
                      color: AppColors.neutral700,
                    ),
                  ),
                ),
                // View Details button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.shiftDetailsScreen,
                      arguments: shift,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "View Details",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.secondaryBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildInfoSection({required String infoText, required IconData icon}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.neutral700),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            infoText,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              navigatorKey.currentState!.context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.neutral700),
          ),
        ),
      ],
    );
  }

  Container _buildDateContainer() {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('dd').format(shift.startDateAndTime),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            DateFormat('MMM').format(shift.startDateAndTime).toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
