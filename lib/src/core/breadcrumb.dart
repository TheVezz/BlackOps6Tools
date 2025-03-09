import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///generates a list of Broadcrumbs based on the name of the route.
///
///[Routtename] is the name of the current route.
///[Context] is the Flutter context to access navigators or themes.
///
///returns a list of maps containing the titles and Broadcrumb actions.
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
