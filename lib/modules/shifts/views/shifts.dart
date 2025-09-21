import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/available_shifts.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/completed_shifts.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/upcoming_shifts.dart';
import 'package:kingdom_care_services_app/widgets/notification_button.dart';

class ShiftsScreen extends StatefulWidget {
  const ShiftsScreen({super.key});

  @override
  State<ShiftsScreen> createState() => _ShiftsScreenState();
}

class _ShiftsScreenState extends State<ShiftsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,

        title: Text(
          "Shifts",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
        actionsPadding: EdgeInsets.only(right: 17),
        actions: [NotificationButton()],
      ),
      body: Column(
        children: [
          _buildTabBar(context),
          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AvailableShifts(),
                UpcomingShifts(),
                CompletedShifts(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTabBar(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white, // text color for selected
        unselectedLabelColor: Colors.black, // text color for unselected
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        dividerColor: Colors.transparent,
        splashBorderRadius: BorderRadius.circular(100),
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        tabs: [
          Tab(text: "Available"),
          Tab(text: "Upcoming"),
          Tab(text: "Past"),
        ],
      ),
    );
  }
}
