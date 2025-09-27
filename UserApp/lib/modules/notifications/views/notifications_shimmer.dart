import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsShimmer extends StatelessWidget {
  const NotificationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Shimmer.fromColors(
        baseColor: AppColors.secondaryBackground,
        highlightColor: Colors.grey.shade200,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Notification items
            ...List.generate(6, (_) => _buildShimmerNotificationItem()),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBox({
    double width = double.infinity,
    double height = 16,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  Widget _buildShimmerNotificationItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmerBox(width: 120, height: 14, radius: 6),
                const SizedBox(height: 6),
                _buildShimmerBox(width: double.infinity, height: 12, radius: 6),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildShimmerBox(width: 40, height: 12, radius: 6),
        ],
      ),
    );
  }
}
