import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/localization/locale_bloc.dart';
import '../core/localization/locale_state.dart';
import '../core/localization/app_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/settings_screen.dart';

class RunningApp extends StatefulWidget {
  const RunningApp({Key? key}) : super(key: key);

  @override
  State<RunningApp> createState() => _RunningAppState();
}

class _RunningAppState extends State<RunningApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MapScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);
        return Scaffold(
          body: SafeArea(bottom: false, child: _screens[_selectedIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: l10n.tr('navigation.home'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.map),
                label: l10n.tr('navigation.map'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: l10n.tr('navigation.settings'),
              ),
            ],
          ),
        );
      },
    );
  }
}
