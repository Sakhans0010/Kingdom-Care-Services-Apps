import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';

class ProfileSectionWidget extends StatelessWidget {
  const ProfileSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.person,
            size: 40,
            color: AppColors.background,
          ),
        ),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: "Good Evening,\n",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //  height: 1.0,
            ),
            children: [
              TextSpan(
                text: "Jenny",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
