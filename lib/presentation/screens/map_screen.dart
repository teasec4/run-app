import 'package:flutter/material.dart';
import '../../core/localization/app_localizations.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Text(
        l10n.tr('navigation.map'),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
