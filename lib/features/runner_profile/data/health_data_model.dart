import 'package:equatable/equatable.dart';

class HealthData extends Equatable {
  final int steps;
  final double calories;
  final DateTime lastSyncTime;

  const HealthData({
    required this.steps,
    required this.calories,
    required this.lastSyncTime,
  });

  HealthData copyWith({
    int? steps,
    double? calories,
    DateTime? lastSyncTime,
  }) {
    return HealthData(
      steps: steps ?? this.steps,
      calories: calories ?? this.calories,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
    );
  }

  @override
  List<Object?> get props => [steps, calories, lastSyncTime];
}
