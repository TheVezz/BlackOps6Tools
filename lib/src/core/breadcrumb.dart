import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Genera una lista di breadcrumb basati sul nome della rotta.
///
/// [routeName] è il nome della rotta corrente.
/// [context] è il contesto Flutter per accedere ai navigatori o ai temi.
///
/// Restituisce una lista di mappe contenenti i titoli e le azioni dei breadcrumb.
List<Map<String, dynamic>> generateBreadcrumb(BuildContext context, String? routeName) {
  if (routeName == null) {
    debugPrint('Breadcrumb routeName is null');
    return [];
  }

  debugPrint('Generating breadcrumb for route: $routeName');

  final breadcrumb = <Map<String, dynamic>>[];

  if (routeName == '/') {
    breadcrumb.add({'title': AppLocalizations.of(context)!.tools});
  } else if (routeName.startsWith('/maps')) {
    // Aggiungi il breadcrumb della home: Tools
    breadcrumb.add({
      'title': AppLocalizations.of(context)!.tools,
      'onTap': () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
    });

    if (routeName.startsWith('/maps/citadelle_des_morts/rune_puzzle')) {
      breadcrumb.add({'title': AppLocalizations.of(context)!.runePuzzle});
    } else if (routeName.startsWith('/maps/citadelle_des_morts/void_sword')) {
      breadcrumb.add({'title': AppLocalizations.of(context)!.balmung});
    } else if (routeName.startsWith('/maps/terminus/dri11')) {
      breadcrumb.add({'title': 'DRI-11'});
    }
  } else if (routeName.startsWith('/settings')) {
    breadcrumb.add({'title': AppLocalizations.of(context)!.settings});
  } else if (routeName.startsWith('/about')) {
    breadcrumb.add({'title': AppLocalizations.of(context)!.about});
  }

  debugPrint('Breadcrumb built with ${breadcrumb.length} items');
  return breadcrumb;
}
