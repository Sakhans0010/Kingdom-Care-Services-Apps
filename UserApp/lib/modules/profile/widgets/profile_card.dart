import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/profile/widgets/profile_image_container.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileImageContainer(
            size: 128,
            child: CustomNetworkImage(
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuBuI2W-N9aAjsPmRD2mpPMBfNixQaonwuHBM6BHEMeEG6W4gQgHG7v3UPxyn0csloWpS5GEpPU79U-fbS0wGH9EGQpdfC77HxKHzm09dcxt8tIwAoE0BbZBcudcb2XDUpFkgtJlIsZZN6qsiO-9MDpVmyoN4k-A2lK_MoGO3pKZU2A1ihRIh3sO8Q6AxSth4M7_hH_6jE3vEYhO_DOugMna2I9ahzuMz-XyucYRlDv9yjzyZZTc6YhG2Bz2XmH1NEYM4dNPKZqUad7U",
            ),
          ),

          const SizedBox(height: 12),
          Text(
            "Sophia Carter",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 4),
          Text(
            "Care Worker",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.darkGrey),
            // TextStyle(color: AppColors.darkGrey, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            "ID: 123456",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
