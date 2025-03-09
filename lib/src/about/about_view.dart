import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Per gestire le icone SVG
import 'package:url_launcher/url_launcher.dart'; // Per aprire i link
import '../core/logger.dart'; // Importa il logger per il debug

/// Pagina Informazioni dell'app.
/// Contiene i link a Nexus Mods, GitHub e Play Store.
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  // Link ai vari siti
  final String nexusModsUrl = "https://next.nexusmods.com/profile/TheVezz98";
  final String githubUrl = "https://github.com/TheVezz/black_ops_6_tools";
  final String playStoreUrl = "";

  /// Funzione per aprire un URL nel browser
  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      logger.warning('Impossibile aprire il link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering About'); // Log per il rendering della pagina

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Questa app è open source.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            "Autore: TheVezz",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Puoi trovare questa app su Nexus Mods, il codice sorgente su GitHub e scaricarla dal Play Store.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          
          // Link a Nexus Mods
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/platform/nexusmods.svg',
              width: 24,
              height: 24,
            ),
            title: const Text("Scarica su Nexus Mods"),
            subtitle: Text(nexusModsUrl, style: Theme.of(context).textTheme.bodySmall),
            onTap: () => _launchUrl(nexusModsUrl),
          ),
          const Divider(),
          
          // Link al Play Store
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/platform/playstore.svg',
              width: 24,
              height: 24,
            ),
            title: const Text("Scarica su Google Play Store"),
            subtitle: Text(playStoreUrl, style: Theme.of(context).textTheme.bodySmall),
            onTap: () => _launchUrl(playStoreUrl),
          ),
          const Divider(),

          // Link a GitHub
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/platform/github.svg',
              width: 24,
              height: 24,
            ),
            title: const Text("Codice sorgente su GitHub"),
            subtitle: Text(githubUrl, style: Theme.of(context).textTheme.bodySmall),
            onTap: () => _launchUrl(githubUrl),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
