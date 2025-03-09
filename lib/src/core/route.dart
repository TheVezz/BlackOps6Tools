import 'package:black_ops_6_zombie_tools/src/maps/citadelle_des_morts/rune_puzzle/rune_puzzle_view.dart';
import 'package:black_ops_6_zombie_tools/src/maps/terminus/dri11/dri11_view.dart';
import 'package:flutter/material.dart';

//core
import 'logger.dart';

//base
import '../maps/tools_view.dart';
import '../settings/settings_view.dart';
import '../settings/settings_controller.dart';
import '../about/about_view.dart';        

//citadelle des morts
import '../maps/citadelle_des_morts/void_sword/void_sword_view.dart';

// Function to map route names to their corresponding widgets.
WidgetBuilder? getRoute(
    String? routeName, Object? arguments, SettingsController settingsController) {
  logger.info('getRoute called with routeName: $routeName, arguments: $arguments');

  final routes = {
    // base
    '/': (context) => const ToolsView(),
    '/settings': (context) {
      logger.info('Navigating to SettingsView');
      return SettingsView(controller: settingsController); // Pass the controller
    },
    '/about': (context) => const AboutView(),

    // Terminus
    '/maps/terminus/dri11': (context) {
      logger.info('Navigating to Dri11View');
      return const Dri11View();
    },

    // Citadelle Des Morts
    '/maps/citadelle_des_morts/void_sword': (context) {
      logger.info('Navigating to VoidSwordView');
      return const VoidSwordView();
    },
    '/maps/citadelle_des_morts/rune_puzzle': (context) {
      logger.info('Navigating to RunePuzzleView');
      return const RunePuzzleView();
    },
  };

  if (routes.containsKey(routeName)) {
    logger.info('Route found for: $routeName');
  } else {
    logger.warning('Route not found for: $routeName');
  }

  return routes[routeName];
}
