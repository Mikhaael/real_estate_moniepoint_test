import 'package:logger/logger.dart';

/// A convenience mixin to expose a [Logger] instance for classes named after
/// their type.
mixin AppLogger {
  Logger get log => Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 5,
          lineLength: 30,
          colors: true,
          printEmojis: true,
          noBoxingByDefault: false,
        ),
      );
}
