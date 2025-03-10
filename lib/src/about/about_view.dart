import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Page information of the app.
// Contains links to Nexus Mods, Github, Play Store, and Ko-Fi support.
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  // Links to various platforms
  final String nexusModsUrl = "https://www.nexusmods.com/callofdutyblackops6/mods/7?tab=description";
  final String githubUrl = "https://github.com/TheVezz/BlackOps6Tools/tree/main";
  final String playStoreUrl = "";
  final String koFiUrl = "https://ko-fi.com/Z8Z11BPKE0";

  // Function to open a URL in the browser
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
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

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildLinkTile(
                context,
                title: AppLocalizations.of(context)!.aboutNexusMods,
                url: nexusModsUrl,
                iconPath: 'assets/images/platform/nexusmods.svg',
              ),
              _buildLinkTile(
                context,
                title: AppLocalizations.of(context)!.aboutGitHub,
                url: githubUrl,
                iconPath: 'assets/images/platform/github.svg',
              ),
              if (playStoreUrl.isNotEmpty)
                _buildLinkTile(
                  context,
                  title: AppLocalizations.of(context)!.aboutPlayStore,
                  url: playStoreUrl,
                  iconPath: 'assets/images/platform/playstore.svg',
                ),
            ],
          ),

          const Divider(),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.aboutDescription3,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          // Ko-Fi Support Section
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => _launchUrl(koFiUrl),
              child: Image.asset(
                'assets/images/kofi.webp',
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method for building a tile with links
  Widget _buildLinkTile(BuildContext context, {
    required String title,
    required String url,
    required String iconPath,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        title: Text(title),
        subtitle: Text(url, style: Theme.of(context).textTheme.bodySmall),
        onTap: () => _launchUrl(url),
      ),
    );
  }
}
