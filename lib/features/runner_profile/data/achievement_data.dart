class AchievementProgress {
  final String id;
  final String name;
  final String icon;
  final double current;
  final double target;
  final String unit;

  AchievementProgress({
    required this.id,
    required this.name,
    required this.icon,
    required this.current,
    required this.target,
    required this.unit,
  });

  double get progress => (current / target).clamp(0.0, 1.0);
  bool get isCompleted => current >= target;
}

final List<AchievementProgress> realAchievements = [
  AchievementProgress(
    id: 'healthy_steps',
    name: 'Healthy Steps',
    icon: '👟',
    current: 8234,
    target: 10000,
    unit: 'steps',
  ),
  AchievementProgress(
    id: 'burn_it_out',
    name: 'Burn It Out',
    icon: '🔥',
    current: 487,
    target: 500,
    unit: 'kcal',
  ),
];
