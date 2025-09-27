import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class UserCurrentShifts extends StatelessWidget {
  const UserCurrentShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          var isOffDay = index == 1 ? true : false;
          return CurrentShiftItem(isOffDay: isOffDay);
        }),
      ),
    );
  }
}

class CurrentShiftItem extends StatelessWidget {
  const CurrentShiftItem({super.key, required this.isOffDay});

  final bool isOffDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 17, bottom: 20),
      width: isOffDay ? 130 : 180,
      height: 260,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isOffDay ? AppColors.grey : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "23",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isOffDay
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
              children: [
                TextSpan(
                  text: isOffDay ? "\nAll Day" : "  Today",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    color: isOffDay ? Colors.black38 : AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          if (!isOffDay)
            Text(
              "9:00 AM - 5:00 PM",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor.withValues(alpha: 0.6),
              ),
            ),
          Spacer(),

          Text(
            isOffDay ? "Free Day" : "Registered Nurse",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: isOffDay ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: isOffDay
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
            ),
          ),
          SizedBox(height: isOffDay ? 20 : 5),
          if (!isOffDay)
            Text(
              "Woodford Hospital",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor.withValues(alpha: 0.6),
              ),
            ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
