import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Page information of the app.
///contains links to Nexus Mods, Github and Play Store.
class AboutView extends StatelessWidget {
  const AboutView({super.key});

  // Link you have some sites
  final String nexusModsUrl = "";
  final String githubUrl = "https://github.com/TheVezz/BlackOps6Tools/tree/main";
  final String playStoreUrl = "";

  ///Function to open a URL in the browser
  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      logger.warning('Impossible open the link: $url');
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
          
          //Link a Nexus Mods
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
          
          // Link al Play Store
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

          // Link a GitHub
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
        ],
      ),
    );
  }
}
