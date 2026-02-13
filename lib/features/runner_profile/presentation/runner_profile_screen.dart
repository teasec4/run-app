import 'package:flutter/material.dart';
import 'package:running_app/core/theme/app_colors.dart';
import 'package:running_app/features/runner_profile/presentation/widgets/lvl_card.dart';
import 'package:running_app/features/runner_profile/presentation/widgets/steps_ccal_card.dart';

class RunnerProfileScreen extends StatelessWidget {
  const RunnerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Container(padding: EdgeInsets.all(12), child: LvlCard()),
        // RUNNER
        SizedBox(
          height: 150,
          width: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(color: AppColors.textSecondary),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: StepsCcalCard()
        ),
        
      ],
    );
  }
}
