import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShiftItemCardShimmer extends StatelessWidget {
  const ShiftItemCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondaryBackground,
      highlightColor: Colors.grey.shade200,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Top row: date + details + image placeholder
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left date block
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 12),
                // Details placeholders
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: AppColors.neutral200,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 14,
                        width: 150,
                        color: AppColors.neutral200,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 14,
                        width: 100,
                        color: AppColors.neutral200,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Image placeholder
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Bottom row: rate + button placeholders
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  height: 36,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(12),
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
