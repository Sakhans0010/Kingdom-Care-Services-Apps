import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kingdom_care_services_app/modules/auth/providers/auth_provider.dart';

var routeDecider = FutureProvider<bool>((ref) async {
  var token = await ref.read(authProvider.notifier).loadToken();

  return token != null;
});
