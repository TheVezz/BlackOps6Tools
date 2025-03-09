import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'maps/tools_view.dart';
import 'settings/settings_controller.dart';
import 'widgets/scaffold_and_appbar/custom_scaffold.dart';
import 'core/route.dart';
import 'core/logger.dart';
import 'core/breadcrumb.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    logger.info('Building MyApp widget');

    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, _) {
        logger.info('Rebuilding MaterialApp due to settings change');
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English locale
            Locale('it', ''), // Italian locale
          ],
          locale: Locale(settingsController.locale), // Set app locale
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(), // Default theme
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode, // Dynamic theme mode
          initialRoute: '/', // Initial route
          onGenerateRoute: (settings) {
            logger.info(
              'Navigating to: ${settings.name} with arguments: ${settings.arguments}',
            );

            // Retrieve the appropriate route
            final routeBuilder =
                getRoute(settings.name, settings.arguments, settingsController);

            if (routeBuilder != null) {
              return MaterialPageRoute(
                builder: (context) => CustomScaffold(
                  breadcrumb: generateBreadcrumb(context, settings.name),
                  body: routeBuilder(context),
                ),
                settings: settings,
              );
            }

            // Default route if no match is found
            logger.warning('No route found for: ${settings.name}');
            return MaterialPageRoute(
              builder: (context) => const ToolsView(),
            );
          },
        );
      },
    );
  }
}
