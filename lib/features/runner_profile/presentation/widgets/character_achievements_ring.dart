import 'package:flutter/material.dart';

class CharacterAchievementsRing extends StatelessWidget {
  final List<AchievementRingItem> achievements;
  final double size;
  final Widget child;

  const CharacterAchievementsRing({
    Key? key,
    required this.achievements,
    required this.child,
    this.size = 160,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Character in center
          child,
          // Top-left
          Positioned(
            top: 0,
            left: 0,
            child: _buildAchievementIcon(achievements[0]),
          ),
          // Top-right
          Positioned(
            top: 0,
            right: 0,
            child: _buildAchievementIcon(achievements[1]),
          ),
          // Bottom-left
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildAchievementIcon(achievements[2]),
          ),
          // Bottom-right
          Positioned(
            bottom: 0,
            right: 0,
            child: _buildAchievementIcon(achievements[3]),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementIcon(AchievementRingItem item) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: item.isUnlocked ? Colors.amber[100] : Colors.grey[100],
        border: Border.all(
          color: item.isUnlocked ? Colors.amber[300]! : Colors.grey[300]!,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: (item.isUnlocked ? Colors.amber : Colors.grey).withValues(
              alpha: 0.2,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Opacity(
          opacity: item.isUnlocked ? 1.0 : 0.5,
          child: Text(item.icon, style: const TextStyle(fontSize: 26)),
        ),
      ),
    );
  }
}

class AchievementRingItem {
  final String icon;
  final bool isUnlocked;

  AchievementRingItem({required this.icon, required this.isUnlocked});
}
