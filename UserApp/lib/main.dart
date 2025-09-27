// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kingdom_care_services_app/constants/app_config.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/utils/app_default_theme.dart';

import 'modules/route_decider/views/route_decider.dart';
import 'routes/routes.dart';
import 'utils/easy_loading_custom_animation.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MyApp()));
  // config loader
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.light
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorColor = AppColors.secondaryColor
    ..indicatorWidget = SizedBox(
      height: 40,
      width: 40,
      child: const CircularProgressIndicator(color: AppColors.primaryColor),
    )
    ..userInteractions = true
    ..dismissOnTap = false
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..customAnimation = CustomAnimation();
}

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
      builder: EasyLoading.init(),
    );
  }
}

init() async {
  //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await dotenv.load();
}
