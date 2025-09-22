import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/notifications/widgets/notification_card.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        NotificationCard(
          icon: Icons.notifications,
          title: "Shift Alert",
          message: "New shift available",
          time: "10 min ago",
          bgColor: AppColors.primary50,
          iconColor: AppColors.primaryColor,
        ),
        NotificationCard(
          icon: Icons.task_alt,
          title: "Shift Confirmation",
          message: "Your shift on Tue, 23rd July at 09:00 has been confirmed.",
          time: "30 min ago",
          bgColor: AppColors.success50,
          iconColor: AppColors.success600,
        ),
        NotificationCard(
          icon: Icons.info,
          title: "System Update",
          message: "Important update regarding your schedule.",
          time: "1 hr ago",
          bgColor: AppColors.neutral100,
          iconColor: AppColors.neutral500,
        ),
        NotificationCard(
          icon: Icons.campaign,
          title: "Announcement",
          message: "New policy changes will take effect from August 1st.",
          time: "2 hrs ago",
          bgColor: AppColors.primaryContainerColor,
          iconColor: AppColors.primaryColor,
        ),
        NotificationCard(
          icon: Icons.cancel,
          title: "Shift Cancellation",
          message: "Your shift on Mon, 22nd July has been cancelled.",
          time: "3 hrs ago",
          bgColor: AppColors.danger50,
          iconColor: AppColors.danger600,
        ),
        NotificationCard(
          icon: Icons.notifications,
          title: "Shift Alert",
          message: "New shift available",
          time: "4 hrs ago",
          bgColor: AppColors.primary50,
          iconColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
