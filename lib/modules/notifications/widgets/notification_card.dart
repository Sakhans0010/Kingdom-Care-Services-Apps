import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String time;
  final Color bgColor;
  final Color iconColor;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12),
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(icon, color: iconColor, size: 28),
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
                  ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: AppColors.neutral700),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
