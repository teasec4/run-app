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
import '../../core/di/service_locator.dart';
import '../../core/storage/goals_storage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final GoalsStorage _goalsStorage;
  late int _stepsGoal;
  late int _caloriesGoal;

  @override
  void initState() {
    super.initState();
    _goalsStorage = getIt<GoalsStorage>();
    _stepsGoal = _goalsStorage.getStepsGoal();
    _caloriesGoal = _goalsStorage.getCaloriesGoal();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.tr('settings.title'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        
        // Goals section
        _buildSettingSection(
          context,
          'Goals',
          [
            _buildGoalSlider(
              context,
              'Steps Goal',
              _stepsGoal,
              1000,
              50000,
              (value) {
                setState(() => _stepsGoal = value);
                _goalsStorage.setStepsGoal(value);
              },
            ),
            const SizedBox(height: 16),
            _buildGoalSlider(
              context,
              'Calories Goal',
              _caloriesGoal,
              100,
              2000,
              (value) {
                setState(() => _caloriesGoal = value);
                _goalsStorage.setCaloriesGoal(value);
              },
            ),
          ],
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

  Widget _buildGoalSlider(
    BuildContext context,
    String label,
    int currentValue,
    int min,
    int max,
    Function(int) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              currentValue.toString(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Slider(
          value: currentValue.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: ((max - min) / 100).toInt(),
          activeColor: AppColors.primary,
          onChanged: (value) {
            onChanged(value.toInt());
          },
        ),
      ],
    );
  }
}
