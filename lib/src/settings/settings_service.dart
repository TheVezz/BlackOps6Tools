import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/logger.dart'; // Import logger for debugging

/// A service that stores and retrieves user settings.
///
/// This class uses shared_preferences to persist user settings locally.
class SettingsService {
  static const String _themeModeKey = 'theme_mode';
  static const String _localeKey = 'locale';

  /// Loads the User's preferred ThemeMode from local storage.
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeModeKey) ?? ThemeMode.system.index;
    logger.info('Loaded user\'s preferred ThemeMode: ${ThemeMode.values[themeIndex]}');
    return ThemeMode.values[themeIndex];
  }

  /// Persists the user's preferred ThemeMode to local storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Prova a salvare il valore e verifica il risultato
    bool success = await prefs.setInt(_themeModeKey, theme.index);
    if (success) {
      logger.info("✅ ThemeMode salvato con successo: $theme");
    } else {
      logger.severe("❌ ERRORE: ThemeMode NON salvato!");
    }
  }

  /// Loads the User's preferred Locale from local storage.
  Future<String> locale() async {
    final prefs = await SharedPreferences.getInstance();
    final storedLocale = prefs.getString(_localeKey) ?? 'en';
    logger.info('Loaded user\'s preferred Locale: $storedLocale');
    return storedLocale;
  }

  /// Persists the user's preferred Locale to local storage.
  Future<void> updateLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Prova a salvare il valore e verifica il risultato
    bool success = await prefs.setString(_localeKey, locale);
    if (success) {
      logger.info("✅ Locale salvato con successo: $locale");
    } else {
      logger.severe("❌ ERRORE: Locale NON salvato!");
    }
  }
}
