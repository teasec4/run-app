import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final String name;
  final String icon;
  final bool isUnlocked;
  final Color textColor;
  final Color? subtextColor;

  const AchievementCard({
    required this.name,
    required this.icon,
    required this.isUnlocked,
    required this.textColor,
    required this.subtextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isUnlocked
              ? [Colors.amber[50]!, Colors.orange[50]!]
              : [Colors.grey[100]!, Colors.grey[200]!],
        ),
        border: Border.all(
          color: isUnlocked ? Colors.amber[300]! : Colors.grey[300]!,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (isUnlocked ? Colors.amber : Colors.grey).withValues(
              alpha: 0.15,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: isUnlocked ? 1.0 : 0.35,
            child: Text(icon, style: const TextStyle(fontSize: 48)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 10,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: isUnlocked ? Colors.green[400] : Colors.grey[400],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isUnlocked ? '✓' : '🔒',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
