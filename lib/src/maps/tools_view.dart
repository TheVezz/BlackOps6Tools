import 'package:flutter/material.dart';
import '../core/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays a grid of maps for Black Ops 6.
/// Each map card navigates to a specific route when tapped.
class ToolsView extends StatelessWidget {
  const ToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering BlackOps6View'); // Log rendering of the view

    // List of tools with titles, routes, image paths and a map indicator.
    final List<Map<String, String>> tools = [
      {
        'title': 'DRI-11 Beamsmasher',
        'route': '/maps/terminus/dri11',
        'image': 'assets/images/maps/terminus/dri11/dri11.webp',
        //'map': 'Terminus',
      },
      {
        'title': AppLocalizations.of(context)!.runePuzzle,
        'route': '/maps/citadelle_des_morts/rune_puzzle',
        'image': 'assets/images/maps/citadelle_des_morts/rune_puzzle/rune_puzzle.webp',
        //'map': 'Citadelle Des Morts',
      },
      {
        'title': AppLocalizations.of(context)!.balmung,
        'route': '/maps/citadelle_des_morts/void_sword',
        'image': 'assets/images/maps/citadelle_des_morts/void_sword/void_svord_puzzle.webp',
        //'map': 'Citadelle Des Morts',
      },
    ];

    // Placeholder image path
    const String placeholderImage = 'assets/images/universal/placeholder.webp';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: tools.map((mapData) {
            logger.fine('Rendering map card: ${mapData['title']}');

            return GestureDetector(
              onTap: () {
                logger.info('Navigating to: ${mapData['route']}');
                Navigator.pushNamed(context, mapData['route']!);
              },
              child: SizedBox(
                width: 210,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Second title (map indicator) sopra l'immagine.
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Text(
                          mapData['map'] ?? '',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          mapData['image'] ?? placeholderImage,
                          fit: BoxFit.contain,
                          height: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          mapData['title']!,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
