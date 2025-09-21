import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/shift_item_card_shimmer.dart';

class ShiftsListShimmer extends StatelessWidget {
  const ShiftsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ShiftItemCardShimmer();
      },
    );
  }
}
