import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/localization/app_localizations.dart';
import 'pixel_runner_character.dart';
import 'character_achievements_ring.dart';
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
    final bgColor = isDarkTheme
        ? AppColors.surfaceDarkSecondary
        : Colors.grey[50];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Level with gradient bar - card style
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('⚡', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 8),
                          Text(
                            '${l10n.tr('stats.level')} 1',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '800/1000',
                        style: TextStyle(
                          color: subtextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: 0.8,
                      minHeight: 10,
                      backgroundColor: isDarkTheme
                          ? AppColors.surfaceDarkSecondary.withValues(
                              alpha: 0.5,
                            )
                          : Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.levelExpOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Character with achievements around
            CharacterAchievementsRing(
              achievements: [
                AchievementRingItem(icon: '🎯', isUnlocked: true),
                AchievementRingItem(icon: '🏆', isUnlocked: true),
                AchievementRingItem(icon: '💪', isUnlocked: false),
                AchievementRingItem(icon: '🌟', isUnlocked: false),
              ],
              size: 180,
              child: const PixelRunnerCharacter(size: 120),
            ),
            const SizedBox(height: 24),

            // Steps and Calories - card containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Steps
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.tr('stats.steps'),
                          style: TextStyle(
                            color: subtextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '8,234',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: 0.82,
                            minHeight: 6,
                            backgroundColor: isDarkTheme
                                ? AppColors.surfaceDarkSecondary.withValues(
                                    alpha: 0.5,
                                  )
                                : Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.stepsBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Calories
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.tr('stats.calories'),
                          style: TextStyle(
                            color: subtextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '487',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: 0.49,
                            minHeight: 6,
                            backgroundColor: isDarkTheme
                                ? AppColors.surfaceDarkSecondary.withValues(
                                    alpha: 0.5,
                                  )
                                : Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.caloriesRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

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
            fontSize: 16,
            letterSpacing: 0.2,
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
            fontSize: 16,
            letterSpacing: 0.2,
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
