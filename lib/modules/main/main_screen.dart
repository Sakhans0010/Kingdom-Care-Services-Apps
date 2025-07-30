import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/modules/availability_scheduler/views/availability_scheduler.dart';
import 'package:kingdom_care_services_app/modules/home/views/home_screen.dart';
import 'package:kingdom_care_services_app/modules/shifts/views/shifts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> dummyAvailability = {
      '2025-05-01': 'Morning',
      '2025-05-02': 'Evening',
      '2025-05-03': 'U/A',
      '2025-05-04': 'Morning',
      '2025-05-05': 'Evening',
      '2025-05-06': 'U/A',
      '2025-05-07': 'Morning',
      '2025-05-08': 'Evening',
      '2025-05-09': 'Morning',
      '2025-05-10': 'U/A',
      '2025-05-11': 'Evening',
      '2025-05-12': 'Morning',
      '2025-05-13': 'U/A',
      '2025-05-14': 'Evening',
      '2025-05-15': 'Morning',
    };
    return Scaffold(body: SafeArea(child: HomeScreen()));
  }
}
