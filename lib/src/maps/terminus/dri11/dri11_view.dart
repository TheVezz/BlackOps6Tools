import 'package:flutter/material.dart';
import '../../../core/logger.dart';
import 'dri11_tool.dart';

class Dri11View extends StatelessWidget {

  const Dri11View({super.key});

  @override
  Widget build(BuildContext context) {
    logger.info('Rendering Dri11View');

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
                  'DRI-11 Beamsmasher',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Tool per la selezione dei simboli
                Dri11Tool(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
