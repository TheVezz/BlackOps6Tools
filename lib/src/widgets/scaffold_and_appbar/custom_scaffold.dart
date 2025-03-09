import 'package:flutter/material.dart';
import '../../core/logger.dart';
import 'custom_breadcrumb.dart';
import 'custom_drawer.dart';

/// CustomScaffold fornisce un layout comune con AppBar, Drawer e contenuto body.
/// I breadcrumb e il drawer sono stati suddivisi in widget separati.
class CustomScaffold extends StatelessWidget {
  final List<Map<String, dynamic>> breadcrumb;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.breadcrumb,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    logger.info('Building CustomScaffold with ${breadcrumb.length} breadcrumb items');

    return Scaffold(
      appBar: AppBar(
        title: ManagementBreadcrumb(breadcrumb: breadcrumb),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                logger.info('Opening Drawer');
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const ManagementDrawer(),
      body: body,
    );
  }
}
