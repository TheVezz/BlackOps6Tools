import 'package:flutter/material.dart';
import '../core/logger.dart';
import 'settings_service.dart';

/// A controller that connects the user interface with the settings logic.
/// It uses `SettingsService` to load, update, and persist user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  // Current settings
  late ThemeMode _themeMode; // Stores the current theme mode
  late String _locale; // Stores the current locale

  // Getters to access the settings
  ThemeMode get themeMode => _themeMode;
  String get locale => _locale;

  /// Load settings from `SettingsService`
  Future<void> loadSettings() async {
    logger.info('Loading settings...');
    try {
      // Load ThemeMode and Locale from the service
      _themeMode = await _settingsService.themeMode();
      _locale = await _settingsService.locale();
      logger.info('Loaded settings: ThemeMode=$_themeMode, Locale=$_locale');
    } catch (e) {
      // Log and fallback to default settings in case of failure
      logger.severe('Failed to load settings: $e');
      _themeMode = ThemeMode.system; // Fallback to default theme
      _locale = 'en'; // Fallback to default locale
    }
    // Notify listeners to rebuild the UI
    notifyListeners();
    logger.fine('Listeners notified');
  }

  /// Update the `ThemeMode` and persist it using `SettingsService`
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == _themeMode) {
      logger.info('ThemeMode update skipped: no change detected');
      return;
    }

    logger.info('Updating ThemeMode to $newThemeMode');
    _themeMode = newThemeMode;

    try {
      // Save the new ThemeMode
      await _settingsService.updateThemeMode(newThemeMode);
      logger.info('ThemeMode saved successfully');
    } catch (e) {
      logger.severe('Failed to save ThemeMode: $e');
    }
    // Notify listeners to rebuild the UI with the new theme
    notifyListeners();
    logger.fine('Listeners notified');
  }

  /// Update the `Locale` and persist it using `SettingsService`
  Future<void> updateLocale(String newLocale) async {
    if (newLocale == _locale) {
      logger.info('Locale update skipped: no change detected');
      return;
    }

    logger.info('Updating Locale to $newLocale');
    _locale = newLocale;

    try {
      // Save the new Locale
      await _settingsService.updateLocale(newLocale);
      logger.info('Locale saved successfully');
    } catch (e) {
      logger.severe('Failed to save Locale: $e');
    }
    // Notify listeners to rebuild the UI with the new locale
    notifyListeners();
    logger.fine('Listeners notified');
  }
}
