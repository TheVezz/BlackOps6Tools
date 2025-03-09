import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Page information of the app.
/// Contains links to Nexus Mods, Github, Play Store, and Ko-Fi support.
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  // Links to various platforms
  final String nexusModsUrl = "https://www.nexusmods.com/callofdutyblackops6/mods/7?tab=description";
  final String githubUrl = "https://github.com/TheVezz/BlackOps6Tools/tree/main";
  final String playStoreUrl = "";
  final String koFiUrl = "https://ko-fi.com/Z8Z11BPKE0";

  /// Function to open a URL in the browser
  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      logger.warning('Impossible to open the link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering About');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.aboutDescription1,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.aboutDescription2,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          
          // Link to Nexus Mods
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/platform/nexusmods.svg',
              width: 24,
              height: 24,
            ),
            title: Text(AppLocalizations.of(context)!.aboutNexusMods),
            subtitle: Text(nexusModsUrl, style: Theme.of(context).textTheme.bodySmall),
            onTap: () => _launchUrl(nexusModsUrl),
          ),
          const Divider(),
          
          // Link to Play Store
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/platform/playstore.svg',
              width: 24,
              height: 24,
            ),
            title: Text(AppLocalizations.of(context)!.aboutPlayStore),
            subtitle: Text(playStoreUrl, style: Theme.of(context).textTheme.bodySmall),
            onTap: () => _launchUrl(playStoreUrl),
          ),
          const Divider(),

          // Link to GitHub
          ListTile(
            leading: SvgPicture.asset(
              'assets/images/platform/github.svg',
              width: 24,
              height: 24,
            ),
            title: Text(AppLocalizations.of(context)!.aboutGitHub),
            subtitle: Text(githubUrl, style: Theme.of(context).textTheme.bodySmall),
            onTap: () => _launchUrl(githubUrl),
          ),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.aboutDescription3,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          
          // Ko-Fi Support Section
          Text(
            "Support Me on Ko-Fi",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () => _launchUrl(koFiUrl),
            child: Image.asset(
              'assets/images/kofi.webp', // Scarica e salva l'immagine in assets
              height: 36,
            ),
          ),
        ],
      ),
    );
  }
}
