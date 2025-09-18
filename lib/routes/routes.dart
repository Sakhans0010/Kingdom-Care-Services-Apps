import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/models/shift.dart';
import 'package:kingdom_care_services_app/modules/auth/views/forgot_password_screen.dart';
import 'package:kingdom_care_services_app/modules/auth/views/login_screen.dart';
import 'package:kingdom_care_services_app/modules/auth/views/signup_screen.dart';
import 'package:kingdom_care_services_app/modules/availability_scheduler/views/availability_scheduler.dart';
import 'package:kingdom_care_services_app/modules/home/views/home_screen.dart';
import 'package:kingdom_care_services_app/modules/main/main_screen.dart';
// import 'package:kingdom_care_services_app/modules/auth/views/login_screen.dart';
// import 'package:kingdom_care_services_app/modules/auth/views/signup_screen.dart';
// import 'package:kingdom_care_services_app/modules/home/views/home_screen.dart';
import 'package:kingdom_care_services_app/modules/route_decider/views/route_decider.dart';
import 'package:kingdom_care_services_app/modules/shifts/views/map_details_screen.dart';
import 'package:kingdom_care_services_app/modules/shifts/views/shift_details_screen.dart';

class Routes {
  static const String login = "login";
  static const String signup = "signup";
  static const String mainScreen = "mainScreen";
  static const String home = "home";
  static const String availabilityScheduler = "availabilityScheduler";
  static const String shiftDetailsScreen = "shiftDetailsScreen";
  static const String mapDetailsScreen = "mapDetailsScreen";
  static const String forgotPassword = "forgotPassword";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case availabilityScheduler:
        return MaterialPageRoute(builder: (_) => AvailabilityScheduler());
      case shiftDetailsScreen:
        var data = settings.arguments as ShiftItem;
        return MaterialPageRoute(
          builder: (_) => ShiftDetailsScreen(shift: data),
        );
      case mapDetailsScreen:
        var data = settings.arguments as ShiftItem;
        return MaterialPageRoute(builder: (_) => MapDetailsScreen(shift: data));

      default:
        return MaterialPageRoute(builder: (_) => const RouteDecider());
    }
  }
}
