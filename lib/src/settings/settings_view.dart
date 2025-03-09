import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings_controller.dart';
import '../core/logger.dart';

///A view that allows the user to customize the app settings.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering SettingsView');
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        //section to select the theme
        _buildSectionHeader(context, AppLocalizations.of(context)!.theme),
        const SizedBox(height: 8),
        _buildThemeSettings(context),
        const Divider(height: 32, thickness: 1),
        
        //section to select the language
        _buildSectionHeader(context, AppLocalizations.of(context)!.language),
        const SizedBox(height: 8),
        _buildLanguageSettings(context),
      ],
    );
  }

  ///builds a section header with a specific title.
  Widget _buildSectionHeader(BuildContext context, String title) {
    logger.fine('Building section header: $title');
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  ///builds the settings for the selection of the theme.
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

  ///builds the settings for selection of the language.
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
                fit: BoxFit.contain,
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
