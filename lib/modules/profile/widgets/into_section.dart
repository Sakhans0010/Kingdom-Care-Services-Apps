// ------------------------
// Helper Widgets
// ------------------------
import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/info_item.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<InfoItem> items;

  const InfoSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.borderColor)),
            ),
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}
