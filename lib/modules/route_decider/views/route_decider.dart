// import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kingdom_care_services_app/modules/auth/views/login_screen.dart';

import '../../main/main_screen.dart';

class RouteDecider extends StatefulWidget {
  const RouteDecider({super.key});

  @override
  State<RouteDecider> createState() => _RouteDeciderState();
}

class _RouteDeciderState extends State<RouteDecider> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
  }

  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   // if the loader is being shown/displayed the returned value should be true if not it should be false.
  //   var isLoading = EasyLoading.isShow;

  //   // if the returned value is true then the route should not be popped.
  //   return isLoading;
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const MainScreen(),
    );
  }
}
