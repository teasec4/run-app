import 'package:flutter/material.dart';
import '../../../core/localization/app_localizations.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🗺️',
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.tr('map.coming_soon'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
