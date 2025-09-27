import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class SectionTitleRow extends StatelessWidget {
  const SectionTitleRow({
    super.key,
    required this.title,
    required this.number,
    required this.onViewAllPressed,
  });
  final String title;
  final String number;
  final VoidCallback? onViewAllPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: title),
              TextSpan(
                text: "  $number",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor.withValues(alpha: 0.45),
                ),
              ),
            ],
          ),
        ),

        Spacer(),
        TextButton(
          onPressed: onViewAllPressed,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "View all",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 16),
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
