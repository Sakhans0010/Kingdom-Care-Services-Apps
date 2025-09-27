import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';

class PatientDetailsCard extends StatelessWidget {
  const PatientDetailsCard({super.key});

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
          const Text("Patient Details"),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.background,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(200),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CustomNetworkImage(
                      imageUrl:
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuAmHZZwxiNy3le_rAc2FdRY9FH3vWIpG3_ozvI1s593QzJ6Uc8_eNfCSW-321RMnY42ZHt5oz9ZMDd6rs-4gCz8TQLhlmP9tV0bTg0J7nvRo-g-IZDSFiEIdvzlWueVgvNHrNTrcAFPa9qqUhQHs8f6t8zw4-40QFzGYAPHx6MXw3RHuyqnJrLYfIVChDA7Rwa-UJtTIEC-IxUsxZE0VErh-HUXJenpRnB9HXPECu6DgodJ1kEOmBCVsJXaAbt3g52huokr5PrlCOb1",
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sarah Thompson",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Sunrise Senior Living",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.neutral700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  label: "View Profile",
                  icon: Icons.person,
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: _buildActionButton(
                  label: "Directions",
                  icon: Icons.map,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildActionButton({
    required String label,
    required IconData icon,
    required void Function() onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary50,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
