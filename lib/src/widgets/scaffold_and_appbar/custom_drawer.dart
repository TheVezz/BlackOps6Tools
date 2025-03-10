import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/logger.dart';

/// Widget that returns the complete drawer,
/// With Header and the various navigation items.
class ManagementDrawer extends StatelessWidget {
  const ManagementDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.menu,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const MapsDrawerTile(),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings,
                  title: AppLocalizations.of(context)!.settings,
                  route: '/settings',
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.info,
                  title: AppLocalizations.of(context)!.about,
                  route: '/about',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper function to build a drawer item.
  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String title, required String route}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () {
        logger.info('Navigating to $route');
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}

/// Widget for the item "Maps" with submenu inside the drawer.
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isExpanded
              ? Column(
                  key: const ValueKey<bool>(true),
                  children: [
                    _buildSubMenuItem(
                        context, 'DRI-11', Icons.filter_1_rounded, '/maps/terminus/dri11'),
                    _buildSubMenuItem(
                        context, 'Rune Puzzle', Icons.filter_2_rounded, '/maps/citadelle_des_morts/rune_puzzle'),
                    _buildSubMenuItem(
                        context, 'Void Sword', Icons.filter_3_rounded, '/maps/citadelle_des_morts/void_sword'),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  /// Helper function to create a sub-menu item with animation.
  Widget _buildSubMenuItem(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      contentPadding: const EdgeInsets.only(left: 72.0),
      onTap: () {
        logger.info('Navigating to $title');
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
