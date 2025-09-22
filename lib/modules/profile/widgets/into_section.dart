// ------------------------
// Helper Widgets
// ------------------------
import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/info_item.dart';
import 'package:kingdom_care_services_app/widgets/section_card.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final Widget? optionalButton;
  final List<InfoItem> items;

  const InfoSection({
    super.key,
    required this.title,
    required this.items,
    this.optionalButton,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.borderColor)),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                ),
                Spacer(),
                if (optionalButton != null) optionalButton!,
              ],
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}
