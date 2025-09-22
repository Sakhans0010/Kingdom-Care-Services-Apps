import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class AnnouncementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const AnnouncementCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: AppColors.neutral100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.neutral700),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: AppColors.neutral700),
                  // TextStyle(fontSize: 13, color: AppColors.neutral500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
