import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/utils/app_images.dart';

class TitleSectionRow extends StatelessWidget {
  final String title;
  const TitleSectionRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        Spacer(),
        IconButton(
          icon: Image.asset(AppImages.NOTIFICATION_BELL, width: 30, height: 30),
          onPressed: () {
            // Handle notifications action
          },
        ),
      ],
    );
  }
}
