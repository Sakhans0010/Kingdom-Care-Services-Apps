import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/modules/chats/views/chats_list_screen.dart';
import 'package:kingdom_care_services_app/modules/home/views/home_screen.dart';
import 'package:kingdom_care_services_app/modules/main/widgets/nav_bar_widget.dart';
import 'package:kingdom_care_services_app/modules/profile/views/profile_screen.dart';
import 'package:kingdom_care_services_app/modules/shifts/views/shifts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ShiftsScreen(),
    ChatsListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: AppColors.background,
        body: SafeArea(child: _screens[_currentIndex]),
        bottomNavigationBar: CustomNavBar(
          currentIndex: _currentIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
