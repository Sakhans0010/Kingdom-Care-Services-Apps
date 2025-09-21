import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isFromCurrentuser,
    required this.message,
    required this.time,
  });

  final bool isFromCurrentuser;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isFromCurrentuser ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(isFromCurrentuser ? 0 : 16),
              bottomLeft: Radius.circular(isFromCurrentuser ? 16 : 0),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              color: isFromCurrentuser
                  ? AppColors.secondaryBackground
                  : AppColors.textpPrimaryColor,
            ),
          ),
        ),
        const SizedBox(height: 4),

        Align(
          alignment: isFromCurrentuser
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(time, style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
