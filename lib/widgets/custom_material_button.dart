import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isBordered = false,
    this.color,
    this.textColor,
    this.fontSize,
    this.height = 56,
    this.icon,
    this.width = double.infinity,
  });

  final String text;
  final Function onTap;
  final bool isBordered;
  final Color? color;
  final Color? textColor;
  final String? icon;
  final double width;
  final double height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.primaryColor;
    final whiteColor = Theme.of(context).colorScheme.onPrimary;
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: !isBordered
              ? BorderSide.none
              : BorderSide(color: color ?? primaryColor, width: 1.5),
        ),
        elevation: isBordered ? 0 : 3,
        textColor: isBordered ? primaryColor : textColor ?? whiteColor,
        color: isBordered ? Colors.transparent : color ?? primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) Image.asset(icon!, height: 25),
            if (icon != null) SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize:
                        fontSize ??
                        Theme.of(context).textTheme.bodyMedium!.fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        onPressed: () => onTap(),
      ),
    );
  }
}
