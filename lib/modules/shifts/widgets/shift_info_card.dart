import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class ShiftInfoCard extends StatefulWidget {
  const ShiftInfoCard({super.key});

  @override
  State<ShiftInfoCard> createState() => _ShiftInfoCardState();
}

class _ShiftInfoCardState extends State<ShiftInfoCard> {
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 20),

          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.neutral700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Shift Information",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.schedule, "Start Time", "9:00 AM"),
          _buildInfoRow(Icons.update, "Expected End", "5:00 PM"),
          _buildInfoRow(Icons.access_time, "Duration", "8 hours"),
          _buildInfoRow(
            Icons.location_on_outlined,
            "Location",
            "123 Main St, Anytown, 123 Main St, Anytown",
          ),
          _buildInfoRow(Icons.work_outline, "Type", "Care Assistant"),
          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.info_outline, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                "Status",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: Colors.green),
                    const SizedBox(width: 6),
                    Text(
                      "Ongoing",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.green.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
