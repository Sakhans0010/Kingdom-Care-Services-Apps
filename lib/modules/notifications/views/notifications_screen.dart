import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/notifications/widgets/notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,

        title: Text(
          "Notifications",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
      ),
      body: NotificationsList(),
    );
  }
}
