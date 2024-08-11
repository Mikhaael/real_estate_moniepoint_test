import 'package:flutter/material.dart';
import 'package:real_estate_moniepoint_test/core/configs/api_config.dart';

class AppConfig {
  static AppConfig? _instance;

  static AppConfig? get instance => _instance;

  final ApiConfig apiConfig;
  final String appName;
  final String? appDynamicLink;
  final String? appPackageName;
  final String? appContactEmail;
  final bool enableDarkMode;
  final bool isProductionMode;

  AppConfig._({
    required this.apiConfig,
    required this.appName,
    this.appDynamicLink,
    this.appPackageName,
    this.appContactEmail,
    this.enableDarkMode = false,
    this.isProductionMode = true,
  });

  factory AppConfig.make({
    required apiConfig,
    required uiConfig,
    required appName,
    appDynamicLink,
    appPackageName,
    appContactEmail,
    isProductionMode,
  }) {
    _instance ??= AppConfig._(
      apiConfig: apiConfig,
      appContactEmail: appContactEmail,
      appDynamicLink: appDynamicLink,
      appPackageName: appPackageName,
      appName: appName,
      enableDarkMode: false,
      isProductionMode: isProductionMode,
    );

    return _instance!;
  }

  factory AppConfig({
    required apiConfig,
    required appName,
    appDynamicLink,
    appPackageName,
    appContactEmail,
    isProductionMode,
  }) {
    return AppConfig._(
      apiConfig: apiConfig,
      appName: appName,
      isProductionMode: isProductionMode,
    );
  }

  bool _disableFirebase = false;

  bool get isFirebaseActive => _disableFirebase == false;

  set disableFirebase(bool disableFirebase) {
    _disableFirebase = disableFirebase;
  }

  static AppConfig of(BuildContext context) {
    return instance!;
  }

  bool isDarkModeEnabled() {
    return enableDarkMode;
  }

  double getMultiplicationFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width <= 400.0 ? 0.85 : 1.0;
  }

  double getHeightMultiplicationFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width <= 400.0 ? 0.75 : 1.0;
  }

  getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
