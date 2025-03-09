import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

// Global logger configuration
final Logger logger = Logger('AppLogger');

// Initialize the logger
void initLogger() {
  Logger.root.level = Level.ALL; // Minimum logging level
  Logger.root.onRecord.listen((LogRecord record) {
    // Log formatting and output
    if (kDebugMode) {
      print('[${record.time}] ${record.level.name}: ${record.message}');
    }
  });
}
