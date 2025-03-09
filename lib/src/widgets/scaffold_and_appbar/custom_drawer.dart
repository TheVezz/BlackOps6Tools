import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/logger.dart';

/// Widget che restituisce il Drawer completo,
/// con header e le varie voci di navigazione.
class ManagementDrawer extends StatelessWidget {
  const ManagementDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              AppLocalizations.of(context)!.menu,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          const MapsDrawerTile(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.settings),
            onTap: () {
              logger.info('Navigating to Settings');
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(AppLocalizations.of(context)!.about),
            onTap: () {
              logger.info('Navigating to About');
              Navigator.of(context).pushNamed('/about');
            },
          ),
        ],
      ),
    );
  }
}

/// Widget per la voce "Maps" con sottomenu all'interno del Drawer.
class MapsDrawerTile extends StatefulWidget {
  const MapsDrawerTile({super.key});

  @override
  State<MapsDrawerTile> createState() => _MapsDrawerTileState();
}

class _MapsDrawerTileState extends State<MapsDrawerTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.construction),
          title: Text(AppLocalizations.of(context)!.tools),
          trailing: IconButton(
            icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          onTap: () {
            logger.info('Navigating to Tools');
            Navigator.of(context).pushNamed('/');
          },
        ),
        if (_isExpanded) ...[
          ListTile(
            leading: const Icon(Icons.filter_1_rounded),
            title: const Text('DRI-11'),
            contentPadding: const EdgeInsets.only(left: 72.0),
            onTap: () {
              logger.info('Navigating to DRI-11');
              Navigator.of(context).pushNamed('/maps/terminus/dri11');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_2_rounded),
            title: const Text('Rune Puzzle'),
            contentPadding: const EdgeInsets.only(left: 72.0),
            onTap: () {
              logger.info('Navigating to Rune Puzzle');
              Navigator.of(context).pushNamed('/maps/citadelle_des_morts/rune_puzzle');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_3_rounded),
            title: const Text('Void Sword'),
            contentPadding: const EdgeInsets.only(left: 72.0),
            onTap: () {
              logger.info('Navigating to Void Sword');
              Navigator.of(context).pushNamed('/maps/citadelle_des_morts/void_sword');
            },
          ),
        ],
      ],
    );
  }
}
