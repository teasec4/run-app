import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_bloc.dart';
import '../../core/theme/theme_state.dart';
import '../../core/theme/theme_event.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/localization/locale_bloc.dart';
import '../../core/localization/locale_state.dart';
import '../../core/localization/locale_event.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDarkTheme =
        Theme.of(context).brightness == Brightness.dark;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.tr('settings.title'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        
        // Language selector
        _buildSettingSection(
          context,
          l10n.tr('settings.language'),
          [
            BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, localeState) {
                final isChineseSelected =
                    localeState.locale.languageCode == 'zh';

                return SwitchListTile(
                  title: Text(
                    isChineseSelected ? '中文 (Chinese)' : 'English',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    isChineseSelected
                        ? '切换到English'
                        : 'Switch to 中文',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  value: isChineseSelected,
                  onChanged: (value) {
                    final newLocale = value
                        ? const Locale('zh', 'CN')
                        : const Locale('en', 'US');
                    context
                        .read<LocaleBloc>()
                        .add(ChangeLocaleEvent(newLocale));
                  },
                  activeColor: AppColors.primary,
                );
              },
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Theme selector
        _buildSettingSection(
          context,
          l10n.tr('settings.theme'),
          [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return SwitchListTile(
                  title: Text(
                    l10n.tr('settings.dark_mode'),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: themeState.isDark,
                  onChanged: (value) {
                    context
                        .read<ThemeBloc>()
                        .add(ChangeThemeEvent(value));
                  },
                  activeColor: AppColors.primary,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }


}
