import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import per la localizzazione
import 'settings_controller.dart';
import '../core/logger.dart'; // Import per il logger

/// Una vista che consente all'utente di personalizzare le impostazioni dell'app.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering SettingsView'); // Log quando viene renderizzata la vista
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Sezione per selezionare il tema
        _buildSectionHeader(context, AppLocalizations.of(context)!.theme),
        const SizedBox(height: 8),
        _buildThemeSettings(context),
        const Divider(height: 32, thickness: 1),
        
        // Sezione per selezionare la lingua
        _buildSectionHeader(context, AppLocalizations.of(context)!.language),
        const SizedBox(height: 8),
        _buildLanguageSettings(context),
      ],
    );
  }

  /// Costruisce un'intestazione di sezione con un titolo specifico.
  Widget _buildSectionHeader(BuildContext context, String title) {
    logger.fine('Building section header: $title'); // Log per la creazione dell'intestazione
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  /// Costruisce le impostazioni per la selezione del tema.
  Widget _buildThemeSettings(BuildContext context) {
    final themes = [
      {
        'label': AppLocalizations.of(context)!.systemTheme,
        'themeMode': ThemeMode.system,
        'icon': Icons.settings,
      },
      {
        'label': AppLocalizations.of(context)!.lightTheme,
        'themeMode': ThemeMode.light,
        'icon': Icons.light_mode,
      },
      {
        'label': AppLocalizations.of(context)!.darkTheme,
        'themeMode': ThemeMode.dark,
        'icon': Icons.dark_mode,
      },
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: themes.map((theme) {
          final isSelected = controller.themeMode == theme['themeMode'];
          return ListTile(
            leading: Icon(
              theme['icon'] as IconData,
              color: isSelected ? Theme.of(context).colorScheme.primary : null,
            ),
            title: Text(theme['label'] as String),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary)
                : null,
            onTap: () {
              logger.info('Theme selected: ${theme['themeMode']}');
              controller.updateThemeMode(theme['themeMode'] as ThemeMode);
            },
          );
        }).toList(),
      ),
    );
  }

  /// Costruisce le impostazioni per la selezione della lingua.
  Widget _buildLanguageSettings(BuildContext context) {
    final languages = [
      {
        'label': AppLocalizations.of(context)!.englishLanguage,
        'locale': 'en',
        'icon': 'assets/images/flags/gb.svg',
      },
      {
        'label': AppLocalizations.of(context)!.italianLanguage,
        'locale': 'it',
        'icon': 'assets/images/flags/it.svg',
      },
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: languages.map((language) {
          final isSelected = controller.locale == language['locale'];
          return ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                language['icon'] as String,
                width: 24,
                height: 24,
                fit: BoxFit.contain, // Mantiene proporzioni senza distorsioni
              ),
            ),
            title: Text(language['label'] as String),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary)
                : null,
            onTap: () {
              logger.info('Language selected: ${language['locale']}');
              controller.updateLocale(language['locale'] as String);
            },
          );
        }).toList(),
      ),
    );
  }
}
