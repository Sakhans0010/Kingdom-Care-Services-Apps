import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/patient_details_card.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/shift_duration_card.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/shift_info_card.dart';

class ShiftInProgressScreen extends StatelessWidget {
  const ShiftInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground, // gray-50
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,
        title: Text(
          "Shift In Progress",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: ColoredBox(
          color: AppColors.background,
          child: Column(
            children: [
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Top card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.medical_services,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Morning Shift",
                                  style:
                                      const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ).copyWith(
                                        color: AppColors.textpPrimaryColor,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Assisted Living Facility",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.neutral700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Duration card
                      ShiftDurationCard(),
                      const SizedBox(height: 24),
                      PatientDetailsCard(),
                      const SizedBox(height: 24),
                      ShiftInfoCard(),
                    ],
                  ),
                ),
              ),

              // Bottom actions
              _buildEndShiftButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildEndShiftButton() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.black45,
                elevation: 3,
              ),
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text(
                "End Shift",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
