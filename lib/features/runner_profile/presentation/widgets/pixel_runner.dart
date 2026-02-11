import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/localization/app_localizations.dart';
import 'pixel_runner_character.dart';
import 'achievement_card.dart';
import 'challenge_card.dart';

class PixelRunner extends StatelessWidget {
  const PixelRunner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? AppColors.textLight : AppColors.textPrimary;
    final subtextColor = isDarkTheme
        ? AppColors.textSecondary
        : AppColors.textSecondary;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Level with gradient bar
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('⚡', style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 6),
                        Text(
                          '${l10n.tr('stats.level')} 1',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '800/1000',
                      style: TextStyle(
                        color: subtextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: 0.8,
                    minHeight: 12,
                    backgroundColor: isDarkTheme
                        ? AppColors.surfaceDarkSecondary
                        : Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.levelExpOrange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Character with achievements around
            SizedBox(
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Character
                  const PixelRunnerCharacter(size: 120),

                  // Achievements around character
                  // Top-left
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _AchievementIcon(icon: '🎯', isUnlocked: true),
                  ),
                  // Top-right
                  Positioned(
                    top: 0,
                    right: 0,
                    child: _AchievementIcon(icon: '🏆', isUnlocked: true),
                  ),
                  // Bottom-left
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: _AchievementIcon(icon: '💪', isUnlocked: false),
                  ),
                  // Bottom-right
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: _AchievementIcon(icon: '🌟', isUnlocked: false),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Steps and Calories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Steps
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.tr('stats.steps'),
                        style: TextStyle(
                          color: subtextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '8,234',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.82,
                          minHeight: 6,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.stepsBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Calories
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.tr('stats.calories'),
                        style: TextStyle(
                          color: subtextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '487',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.49,
                          minHeight: 6,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.caloriesRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Achievements & Challenges Section
            _AchievementsChallengesSection(
              isDarkTheme: isDarkTheme,
              textColor: textColor,
              subtextColor: subtextColor,
              l10n: l10n,
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementIcon extends StatelessWidget {
  final String icon;
  final bool isUnlocked;

  const _AchievementIcon({required this.icon, required this.isUnlocked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isUnlocked ? Colors.amber[200] : Colors.grey[300],
        border: Border.all(
          color: isUnlocked ? Colors.amber[600]! : Colors.grey[400]!,
          width: 2,
        ),
      ),
      child: Center(
        child: Opacity(
          opacity: isUnlocked ? 1.0 : 0.4,
          child: Text(icon, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class _AchievementsChallengesSection extends StatelessWidget {
  final bool isDarkTheme;
  final Color textColor;
  final Color? subtextColor;
  final AppLocalizations l10n;

  const _AchievementsChallengesSection({
    required this.isDarkTheme,
    required this.textColor,
    required this.subtextColor,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Achievements section
        Text(
          '🏅 ${l10n.tr('achievements.title')}',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              AchievementCard(
                name: l10n.tr('achievements.first_steps'),
                icon: '👟',
                isUnlocked: true,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
              AchievementCard(
                name: l10n.tr('achievements.marathon_runner'),
                icon: '🏃',
                isUnlocked: true,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
              AchievementCard(
                name: l10n.tr('achievements.speed_demon'),
                icon: '⚡',
                isUnlocked: false,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
              AchievementCard(
                name: l10n.tr('achievements.mountain_climber'),
                icon: '⛰️',
                isUnlocked: false,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Challenges section
        Text(
          '🎯 ${l10n.tr('challenges.title')}',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ChallengeCard(
                name: l10n.tr('challenges.walk_10km'),
                icon: '🚶',
                progress: 0.65,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
              ChallengeCard(
                name: l10n.tr('challenges.burn_500_cal'),
                icon: '🔥',
                progress: 0.42,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
              ChallengeCard(
                name: l10n.tr('challenges.7days_streak'),
                icon: '📅',
                progress: 0.86,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
