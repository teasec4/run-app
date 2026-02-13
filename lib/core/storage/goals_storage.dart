import 'package:shared_preferences/shared_preferences.dart';

class GoalsStorage {
  static const String _stepsGoalKey = 'steps_goal';
  static const String _caloriesGoalKey = 'calories_goal';

  static const int defaultStepsGoal = 10000;
  static const int defaultCaloriesGoal = 500;

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setStepsGoal(int steps) async {
    await _prefs.setInt(_stepsGoalKey, steps);
  }

  Future<void> setCaloriesGoal(int calories) async {
    await _prefs.setInt(_caloriesGoalKey, calories);
  }

  int getStepsGoal() {
    return _prefs.getInt(_stepsGoalKey) ?? defaultStepsGoal;
  }

  int getCaloriesGoal() {
    return _prefs.getInt(_caloriesGoalKey) ?? defaultCaloriesGoal;
  }

  Future<void> reset() async {
    await _prefs.remove(_stepsGoalKey);
    await _prefs.remove(_caloriesGoalKey);
  }
}
