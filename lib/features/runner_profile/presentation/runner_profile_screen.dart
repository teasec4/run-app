import 'package:flutter/material.dart';
import 'package:running_app/core/theme/app_colors.dart';
import 'package:running_app/core/di/service_locator.dart';
import 'package:running_app/core/storage/goals_storage.dart';
import 'package:running_app/features/runner_profile/presentation/widgets/lvl_card.dart';
import 'package:running_app/features/runner_profile/presentation/widgets/steps_ccal_card.dart';

class RunnerProfileScreen extends StatelessWidget {
  const RunnerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalsStorage = getIt<GoalsStorage>();
    final stepsGoal = goalsStorage.getStepsGoal().toDouble();
    final caloriesGoal = goalsStorage.getCaloriesGoal().toDouble();

    return Column(
      mainAxisAlignment: .center,
      children: [
        Container(padding: EdgeInsets.all(12), child: LvlCard()),
        
        // Steps
        Container(
          padding: EdgeInsets.all(12),
          child: StepsCcalCard(
            isCalories: false,
            title: 'Steps',
            stepsGoal: stepsGoal,
            caloriesGoal: caloriesGoal,
          ),
        ),
        
        // Calories
        Container(
          padding: EdgeInsets.all(12),
          child: StepsCcalCard(
            isCalories: true,
            title: 'Calories',
            stepsGoal: stepsGoal,
            caloriesGoal: caloriesGoal,
          ),
        ),
        
      ],
    );
  }
}
