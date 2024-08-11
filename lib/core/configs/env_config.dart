import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static get envFile => kReleaseMode ? '.env.production' : '.env.staging';
  // static get envFile => '.env.staging';
  static get baseUrl => dotenv.env['BASE_URL'] ?? '';

  static get webSocketUrl => dotenv.env['WEB_SOCKET_URL'] ?? '';

  static get paymentPlatform => dotenv.env['PAYSTACK_PUBLIC_KEY'] ?? '';

  static get paymentProvider => dotenv.env['DEFAULT_PROVIDER'] ?? '';
}
