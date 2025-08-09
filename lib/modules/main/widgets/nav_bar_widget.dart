import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/app_utils/app_images.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: AppColors.background,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildTabItem(icon: AppImages.HOME, index: 0),
        _buildTabItem(icon: AppImages.CALENDER, index: 1),
        _buildTabItem(icon: AppImages.MESSAGE, index: 2),
        _buildTabItem(icon: AppImages.MENU, index: 3),
      ],
    );
  }

  BottomNavigationBarItem _buildTabItem({
    required String icon,
    required int index,
    String label = "",
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        height: 28,
        width: 28,
        color: currentIndex == index
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: 0.45),
      ),
      label: label,
    );
  }
}
