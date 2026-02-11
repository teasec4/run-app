import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsState(),
      child: Consumer<SettingsState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Center(
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
