import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';

class UserChatItem extends StatelessWidget {
  const UserChatItem({
    super.key,

    required this.imageUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.isOnline = false,
    this.unreadCount = 0,
  });

  final String imageUrl;
  final String name;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.chatScreen);
      },
      splashColor: AppColors.primaryContainerColor,
      highlightColor: AppColors.primaryContainerColor.withValues(alpha: 0.5),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          // boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserAvatar(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: unreadCount > 0
                              ? AppColors.primaryColor
                              : AppColors.neutral500,
                          fontSize: 14,
                          fontWeight: unreadCount > 0
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Stack(
                    clipBehavior: Clip.none,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lastMessage,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 15,
                          color: unreadCount > 0
                              ? AppColors.textpPrimaryColor
                              : AppColors.neutral500,
                          fontWeight: unreadCount > 0
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),

                        overflow: TextOverflow.ellipsis,
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          bottom: -5,
                          right: -35,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.error,

                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              unreadCount.toString(),
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    color: AppColors.secondaryBackground,
                                    fontSize: 13,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildUserAvatar() {
    return Stack(
      children: [
        CircleAvatar(radius: 28, backgroundImage: NetworkImage(imageUrl)),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
