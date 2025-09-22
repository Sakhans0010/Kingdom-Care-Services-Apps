import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class ShiftDurationCard extends StatelessWidget {
  const ShiftDurationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("SHIFT DURATION", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(
            "Started at 9:00 AM",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.textSecondaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "01:45:32",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: 0.43,
              minHeight: 8,
              backgroundColor: AppColors.primaryColor.withValues(alpha: 0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
