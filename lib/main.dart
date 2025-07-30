// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kingdom_care_services_app/app_utils/app_config.dart';
import 'package:kingdom_care_services_app/app_utils/app_default_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';

import 'app_utils/easy_loading_custom_animation.dart';
import 'modules/route_decider/views/route_decider.dart';
import 'routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await init();
  

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    // const ProviderScope(
    
    // child: 
    MyApp()
  // )
  );
  // configLoading();
}

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.ring
//     ..loadingStyle = EasyLoadingStyle.light
//     ..animationStyle = EasyLoadingAnimationStyle.scale
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..indicatorColor = AppColors.secondaryColor
//     ..progressColor = Colors.yellow
//     ..backgroundColor = Colors.green
//     ..indicatorColor = Colors.yellow
//     ..textColor = Colors.yellow
//     ..maskColor = Colors.blue
//     ..userInteractions = true
//     ..dismissOnTap = false
//     ..userInteractions = false
//     ..maskType = EasyLoadingMaskType.black
//     ..customAnimation = CustomAnimation();
// }

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppThemes(context).defaultTheme(context),
      home: RouteDecider(),
      onGenerateRoute: Routes.generateRoute,
      // builder: EasyLoading.init(),
    );
  }
}

// init() async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await dotenv.load();
// }
