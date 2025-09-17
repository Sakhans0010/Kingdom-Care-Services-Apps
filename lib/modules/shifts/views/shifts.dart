import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/available_shifts.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/completed_shifts.dart';
import 'package:kingdom_care_services_app/modules/shifts/widgets/upcoming_shifts.dart';
import 'package:kingdom_care_services_app/widgets/title_section_row.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

      child: Column(
        children: [
          TitleSectionRow(title: "Shifts"),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
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
          ),
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
}
