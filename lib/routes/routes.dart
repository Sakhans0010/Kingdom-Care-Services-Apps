import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/modules/availability_scheduler/views/availability_scheduler.dart';
// import 'package:kingdom_care_services_app/modules/auth/views/login_screen.dart';
// import 'package:kingdom_care_services_app/modules/auth/views/signup_screen.dart';
// import 'package:kingdom_care_services_app/modules/home/views/home_screen.dart';
import 'package:kingdom_care_services_app/modules/route_decider/views/route_decider.dart';

class Routes {
  static const String login = "login";
  static const String signup = "signup";
  static const String home = "home";
  static const String availabilityScheduler = "availabilityScheduler";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case login:
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      // case signup:
      //   return MaterialPageRoute(builder: (_) => SignupScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      case availabilityScheduler:
        return MaterialPageRoute(builder: (_) => AvailabilityScheduler());
        
      default:
        return MaterialPageRoute(builder: (_) => const RouteDecider());
    }
  }
}
