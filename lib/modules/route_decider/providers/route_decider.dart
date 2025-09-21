import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kingdom_care_services_app/constants/storage_keys.dart';
import 'package:kingdom_care_services_app/modules/auth/providers/auth_provider.dart';
import 'package:kingdom_care_services_app/modules/route_decider/enums/routes_enums.dart';
import 'package:kingdom_care_services_app/services/storage_services.dart';

var routeDecider = FutureProvider<RouteTo>((ref) async {
  final storage = SecureStorageService();

  var token = await ref.read(authProvider.notifier).loadToken();

  if (token != null) {
    return RouteTo.MainScreen;
  }

  var onboardingSeen = await storage.read(key: StorageKeys.onboardingSeenKey);

  if (onboardingSeen == "true") return RouteTo.LoginScreen;

  return RouteTo.OnboardingScreen;
});
