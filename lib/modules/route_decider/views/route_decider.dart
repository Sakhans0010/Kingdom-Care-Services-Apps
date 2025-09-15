// import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingdom_care_services_app/constants/api_response_messages.dart';
import 'package:kingdom_care_services_app/modules/auth/views/login_screen.dart';
import 'package:kingdom_care_services_app/modules/main/main_screen.dart';
import 'package:kingdom_care_services_app/modules/route_decider/providers/route_decider.dart';
import 'package:kingdom_care_services_app/modules/splash/splash_screen.dart';

class RouteDecider extends ConsumerStatefulWidget {
  const RouteDecider({super.key});

  @override
  ConsumerState<RouteDecider> createState() => _RouteDeciderState();
}

class _RouteDeciderState extends ConsumerState<RouteDecider> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    // if the loader is being shown/displayed the returned value should be true if not it should be false.
    var isLoading = EasyLoading.isShow;

    // if the returned value is true then the route should not be popped.
    return isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(routeDecider)
        .when(
          data: (isLoggedIn) {
            return isLoggedIn ? MainScreen() : LoginScreen();
          },
          error: (error, stackTrace) {
            log("Route Decider: $error");
            Fluttertoast.showToast(
              msg: ApiResponseMessages.somethingWentWrong,
              backgroundColor: Theme.of(context).colorScheme.error,
            );
            return SplashScreen();
          },
          loading: () => SplashScreen(),
        );
  }
}
