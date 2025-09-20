import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class ProfileImageContainer extends StatelessWidget {
  final double size;
  final BoxShape shape;
  final Color borderColor;

  final Widget child;

  const ProfileImageContainer({
    super.key,

    this.size = 100,
    this.shape = BoxShape.circle,

    this.borderColor = AppColors.primaryColor,

    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: shape,
        border: Border.all(color: borderColor, width: 4),
      ),
      child: ClipOval(child: child),
    );
  }
}
