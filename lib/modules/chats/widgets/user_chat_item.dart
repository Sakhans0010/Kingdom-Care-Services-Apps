import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class UserChatItem extends StatelessWidget {
  const UserChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryContainerColor,
      highlightColor: AppColors.primaryContainerColor.withValues(alpha: 0.5),
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Robert",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 18),
                  ),

                  Text(
                    "Last message here...",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                DateFormat('hh:mm a').format(DateTime.now()),

                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
