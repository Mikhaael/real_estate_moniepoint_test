import 'package:real_estate_moniepoint_test/core/preferences/app_preference.dart';
import 'package:real_estate_moniepoint_test/core/preferences/auth_preference.dart';
import 'package:real_estate_moniepoint_test/core/services/navigation_service.dart';
import 'package:real_estate_moniepoint_test/core/services/preference_service.dart';
import 'package:get_it/get_it.dart';

final app = GetIt.instance;

/// Adds all globally available services to service locator
Future<void> setupServices() async {
  app
    ..registerLazySingleton(() => AppNavigator())
    ..registerLazySingleton(() => AuthPreferences())
    ..registerLazySingleton(() => const AppPreferences());
}
