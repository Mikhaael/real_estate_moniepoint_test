import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_moniepoint_test/core/bloc_observer.dart';
import 'package:real_estate_moniepoint_test/core/configs/api_config.dart';
import 'package:real_estate_moniepoint_test/core/configs/app_config.dart';
import 'package:real_estate_moniepoint_test/core/data/app_repository.dart';
import 'package:real_estate_moniepoint_test/core/global_provider.dart';
import 'package:real_estate_moniepoint_test/core/logger/init_logger.dart';
import 'package:real_estate_moniepoint_test/core/preferences/app_preference.dart';
import 'package:real_estate_moniepoint_test/core/services/service_locator.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/home.dart';
import 'package:real_estate_moniepoint_test/main.dart';

class RealEstateApp with AppLogger {
  static Future<Widget> initializeApp({
    required String baseUrl,
    required String webSocketUrl,
    bool isProduction = false,
    String appName = "RealEstate",
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final apiConfig = ApiConfig.make(
      baseUrl,
      webSocketUrl: webSocketUrl,
      apiDebugMode: !isProduction,
    );

    final appConfig = AppConfig(
      apiConfig: apiConfig,
      appName: appName,
      isProductionMode: isProduction,
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await setupServices();

    Bloc.observer = AppBlocObserver();
    String initialRoute = DashboardHome.route;

    const lastRoute = "";

    final carPoolApp = RepositoryProvider.value(
      value: AppRepository(const AppPreferences()),
      child: GlobalProvider(
        appConfig: appConfig,
        child: MyApp(
          initialRoute: initialRoute,
          continueOnboardingScreen: lastRoute,
        ),
      ),
    );

    return carPoolApp;
  }
}
