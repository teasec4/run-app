import 'package:flutter/material.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? AppColors.textLight : AppColors.textPrimary;
    final subtextColor = AppColors.textSecondary;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map container
            Container(
              height: 350,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Map background (placeholder)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.green[300]!,
                          Colors.green[100]!,
                          Colors.blue[200]!,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 60,
                            color: AppColors.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.tr('map.coming_soon'),
                            style: TextStyle(
                              color: AppColors.textLight,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Current location button
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          customBorder: const CircleBorder(),
                          child: Icon(
                            Icons.my_location,
                            color: AppColors.info,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Top info bar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.tr('map.current_location'),
                                style: const TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'San Francisco, CA',
                                style: const TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textLight.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '2.3 km',
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Stats section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.tr('map.todays_route'),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildStatCard(
                        label: l10n.tr('map.distance'),
                        value: '12.5 km',
                        icon: '📍',
                        color: AppColors.info,
                        textColor: textColor,
                        subtextColor: subtextColor,
                      ),
                      const SizedBox(width: 12),
                      _buildStatCard(
                        label: l10n.tr('map.duration'),
                        value: '1h 45m',
                        icon: '⏱️',
                        color: AppColors.primary,
                        textColor: textColor,
                        subtextColor: subtextColor,
                      ),
                      const SizedBox(width: 12),
                      _buildStatCard(
                        label: l10n.tr('map.avg_speed'),
                        value: '7.1 km/h',
                        icon: '💨',
                        color: AppColors.success,
                        textColor: textColor,
                        subtextColor: subtextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Saved routes section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🗂️ ${l10n.tr('map.saved_routes')}',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildRouteCard(
                    name: l10n.tr('map.golden_gate'),
                    distance: '8.5 km',
                    time: '1h 12m',
                    difficulty: l10n.tr('map.easy'),
                    color: AppColors.success,
                    textColor: textColor,
                    subtextColor: subtextColor,
                  ),
                  const SizedBox(height: 10),
                  _buildRouteCard(
                    name: l10n.tr('map.bay_bridge'),
                    distance: '15.2 km',
                    time: '2h 8m',
                    difficulty: l10n.tr('map.hard'),
                    color: AppColors.error,
                    textColor: textColor,
                    subtextColor: subtextColor,
                  ),
                  const SizedBox(height: 10),
                  _buildRouteCard(
                    name: l10n.tr('map.marina_district'),
                    distance: '5.3 km',
                    time: '45m',
                    difficulty: l10n.tr('map.medium'),
                    color: AppColors.primary,
                    textColor: textColor,
                    subtextColor: subtextColor,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required String icon,
    required Color color,
    required Color textColor,
    required Color? subtextColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withValues(alpha: 0.1),
              color.withValues(alpha: 0.05),
            ],
          ),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: subtextColor, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteCard({
    required String name,
    required String distance,
    required String time,
    required String difficulty,
    required Color color,
    required Color textColor,
    required Color? subtextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.08),
            color.withValues(alpha: 0.02),
          ],
        ),
        border: Border.all(color: color.withValues(alpha: 0.15), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.2),
            ),
            child: Center(child: Icon(Icons.route, color: color, size: 24)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      distance,
                      style: TextStyle(color: subtextColor, fontSize: 10),
                    ),
                    Text(
                      ' • ',
                      style: TextStyle(color: subtextColor, fontSize: 10),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: subtextColor, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              difficulty,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
