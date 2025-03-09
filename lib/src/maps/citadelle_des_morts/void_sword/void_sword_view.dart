import 'package:flutter/material.dart';
import '../../../core/logger.dart';
import 'void_sword_tool.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays detailed instructions for obtaining the Balmung (Void Sword).
class VoidSwordView extends StatelessWidget {

  const VoidSwordView({super.key});

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering VoidSwordView');

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Main Title
                Text(
                  AppLocalizations.of(context)!.balmung,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                
                // Tool per la selezione dei simboli (centrato)
                VoidSwordTool(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
