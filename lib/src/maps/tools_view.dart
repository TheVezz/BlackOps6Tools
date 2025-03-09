import 'package:flutter/material.dart';
import '../core/logger.dart'; // Import logger for debugging
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
      },
      {
        'title': AppLocalizations.of(context)!.runePuzzle,
        'route': '/maps/citadelle_des_morts/rune_puzzle',
        'image': 'assets/images/maps/citadelle_des_morts/rune_puzzle/rune_puzzle.webp',
      },
      {
        'title': AppLocalizations.of(context)!.balmung,
        'route': '/maps/citadelle_des_morts/void_sword',
        'image': 'assets/images/maps/citadelle_des_morts/void_sword/void_svord_puzzle.webp',
      },
    ];

    // Placeholder image path
    const String placeholderImage = 'assets/images/universal/placeholder.webp';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Wrap(
          spacing: 16, // Spaziatura orizzontale tra gli elementi
          runSpacing: 16, // Spaziatura verticale tra le righe
          alignment: WrapAlignment.center, // Centrare gli elementi
          children: tools.map((mapData) {
            logger.fine('Rendering map card: ${mapData['title']}'); // Log map rendering

            return GestureDetector(
              onTap: () {
                logger.info('Navigating to: ${mapData['route']}'); // Log navigation action
                Navigator.pushNamed(context, mapData['route']!);
              },
              child: SizedBox(
                width: 210, // Larghezza fissa per le card
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Angoli arrotondati
                  ),
                  elevation: 4, // Ombra della card
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
                          top: Radius.circular(15), // Angoli arrotondati per l'immagine
                        ),
                        child: Image.asset(
                          mapData['image'] ?? placeholderImage, // Percorso dell'immagine
                          fit: BoxFit.contain, // Adattamento dell'immagine
                          height: 150, // Altezza fissa per uniformità
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
