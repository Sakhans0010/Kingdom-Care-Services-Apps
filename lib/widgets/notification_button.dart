import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/main.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
import 'package:kingdom_care_services_app/utils/app_images.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Image.asset(AppImages.NOTIFICATION_BELL, width: 30, height: 30),
          onPressed: () {
            Navigator.pushNamed(
              navigatorKey.currentState!.context,
              Routes.notificationsScreen,
            );
          },
        ),

        Positioned(
          right: 10,
          top: 10,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.error,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
