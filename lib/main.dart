import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/core/logger.dart'; // Import logger for debugging

void main() async {
  // Initialize the logger
  initLogger(); // Ensure the logger is initialized
  logger.info('Application is starting...');

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  logger.info('Setting up SettingsController...');
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme and locale settings.
  try {
    logger.info('Loading user settings...');
    await settingsController.loadSettings();
    logger.info('Settings loaded successfully: '
        'ThemeMode=${settingsController.themeMode}, Locale=${settingsController.locale}');
  } catch (e) {
    logger.severe('Failed to load settings: $e');
  }

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  logger.info('Running the app...');
  runApp(MyApp(settingsController: settingsController));
}
