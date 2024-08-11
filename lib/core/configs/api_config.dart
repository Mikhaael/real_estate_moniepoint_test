class ApiConfig {
  final bool apiDebugMode;
  final String baseUrl;
  final String webSocketUrl;
  final String? defaultCardProvider;

  ApiConfig._({
    this.apiDebugMode = true,
    this.defaultCardProvider,
    required this.baseUrl,
    required this.webSocketUrl,
  });

  factory ApiConfig(
    String baseUrl, {
    String? defaultProvider,
    bool force = false,
    bool apiDebugMode = true,
    required String webSocketUrl,
  }) {
    return ApiConfig._(
      apiDebugMode: apiDebugMode,
      baseUrl: baseUrl,
      webSocketUrl: webSocketUrl,
      defaultCardProvider: defaultProvider,
    );
  }

  factory ApiConfig.make(
    String baseUrl, {
    required String webSocketUrl,
    String? defaultProvider,
    bool apiDebugMode = true,
  }) {
    return ApiConfig(
      baseUrl,
      apiDebugMode: apiDebugMode,
      webSocketUrl: webSocketUrl,
      defaultProvider: defaultProvider,
    );
  }
}
