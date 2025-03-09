import 'package:flutter/material.dart';

/// Widget che gestisce la visualizzazione dei breadcrumb,
/// scegliendo se mostrare la riga completa o un dropdown in base allo spazio disponibile.
class ManagementBreadcrumb extends StatelessWidget {
  final List<Map<String, dynamic>> breadcrumb;

  const ManagementBreadcrumb({
    super.key,
    required this.breadcrumb,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final totalWidth = breadcrumb.fold<double>(
          0.0,
          (sum, crumb) => sum + (crumb['title'].length * 10.0),
        );

        if (totalWidth > availableWidth) {
          return _BreadcrumbWithDropdown(
            breadcrumb: breadcrumb,
            maxWidth: availableWidth,
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _BreadcrumbRow(
              breadcrumb: breadcrumb,
              currentRoute: ModalRoute.of(context)?.settings.name ?? '/',
            ),
          );
        }
      },
    );
  }
}

/// Mostra i breadcrumb su una riga.
class _BreadcrumbRow extends StatelessWidget {
  final List<Map<String, dynamic>> breadcrumb;
  final String currentRoute;

  const _BreadcrumbRow({
    required this.breadcrumb,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: breadcrumb.map((crumb) {
        final isLast = breadcrumb.last == crumb;
        final isCurrentPage = currentRoute == crumb['route'];
        return GestureDetector(
          onTap: isCurrentPage || isLast ? null : crumb['onTap'],
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                crumb['title'],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isLast || isCurrentPage
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
                      decoration: isCurrentPage ? TextDecoration.underline : null,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              if (!isLast)
                Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Mostra i breadcrumb abbreviati tramite un PopupMenu.
class _BreadcrumbWithDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> breadcrumb;
  final double maxWidth;

  const _BreadcrumbWithDropdown({
    required this.breadcrumb,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final dropdownCrumbs = breadcrumb.sublist(0, breadcrumb.length - 1);
    final lastCrumb = breadcrumb.last;

    return Row(
      children: [
        PopupMenuButton<Map<String, dynamic>>(
          icon: Icon(
            Icons.more_horiz,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onSelected: (crumb) {
            if (crumb['onTap'] != null) {
              crumb['onTap']();
            }
          },
          itemBuilder: (context) {
            return dropdownCrumbs
                .map(
                  (crumb) => PopupMenuItem<Map<String, dynamic>>(
                    value: crumb,
                    child: Text(
                      crumb['title'],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                )
                .toList();
          },
        ),
        Text(
          lastCrumb['title'],
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
