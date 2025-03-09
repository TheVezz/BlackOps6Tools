import 'package:flutter/material.dart';
import '../../../core/logger.dart';
import 'rune_puzzle_tool.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Visualizza la vista per RunePuzzleView.
class RunePuzzleView extends StatelessWidget {
  const RunePuzzleView({super.key});

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering RunePuzzleView');

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
                Text(
                  AppLocalizations.of(context)!.runePuzzle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                RunePuzzleTool(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
