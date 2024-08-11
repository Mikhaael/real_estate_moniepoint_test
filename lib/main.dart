import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/home.dart';
import 'package:real_estate_moniepoint_test/real_estate.dart';
import 'package:real_estate_moniepoint_test/core/configs/env_config.dart';
import 'package:real_estate_moniepoint_test/core/services/navigation_service.dart';
import 'package:real_estate_moniepoint_test/core/services/service_locator.dart';
import 'package:real_estate_moniepoint_test/core/utils/constants.dart';
// import 'package:real_estate/core/widgets/app_message.dart';

void main() async {
  await dotenv.load(fileName: Environment.envFile);
  try {
    final carPoolApp = await RealEstateApp.initializeApp(
      baseUrl: Environment.baseUrl,
      webSocketUrl: Environment.webSocketUrl,
    );

    runApp(carPoolApp);
  } catch (e) {
    Logger().i(e);
  }
}

class MyApp extends StatefulWidget {
  MyApp({
    super.key,
    required this.initialRoute,
    required this.continueOnboardingScreen,
  });

  final String initialRoute;
  final String continueOnboardingScreen;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Posthog().screen(screenName: "Home Screen");
    return MaterialApp(
      title: "Payed",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kFontFamily,
        scaffoldBackgroundColor: kWhite,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kWhite,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      navigatorKey: app<AppNavigator>().key,
      onGenerateRoute: onGenerateRoute,
      initialRoute: widget.initialRoute,
      builder: (_, Widget? child) =>  child ?? DashboardHome(),
    );
  }
}
