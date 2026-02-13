import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/health_bloc.dart';
import '../bloc/health_state.dart';
import '../bloc/health_event.dart';

class StepsCcalCard extends StatelessWidget {
  final bool isCalories;
  final String title;
  final double stepsGoal;
  final double caloriesGoal;

  const StepsCcalCard({
    super.key,
    required this.isCalories,
    required this.title,
    required this.stepsGoal,
    required this.caloriesGoal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HealthBloc, HealthState>(
      listener: (context, state) {
        if (state is HealthSynced) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: const Duration(seconds: 2),
            ),
          );
        } else if (state is HealthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<HealthBloc>().add(const SyncHealthDataEvent());
        },
        child: BlocBuilder<HealthBloc, HealthState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title),
                      _buildValueText(state, isCalories: isCalories),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        value: _getProgress(state),
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
                  
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildValueText(HealthState state, {required bool isCalories}) {
    if (state is HealthLoaded) {
      final value = isCalories ? state.data.calories.toInt() : state.data.steps;
      return Text(value.toString());
    } else if (state is HealthSynced) {
      final value = isCalories ? state.data.calories.toInt() : state.data.steps;
      return Text(value.toString());
    } else if (state is HealthLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    } else if (state is HealthError) {
      return Text('--', style: TextStyle(color: Colors.red));
    } else if (state is HealthAuthorizationDenied) {
      return Text('--', style: TextStyle(color: Colors.orange));
    }
    return Text('0');
  }

  double _getProgress(HealthState state) {
    final target = isCalories ? caloriesGoal : stepsGoal;
    final value = isCalories
        ? _getValue(state, isCalories: true)
        : _getValue(state, isCalories: false);

    if (value > 0) {
      return (value / target).clamp(0.0, 1.0);
    }
    return 0.0;
  }

  double _getValue(HealthState state, {required bool isCalories}) {
    if (state is HealthLoaded) {
      return isCalories ? state.data.calories : state.data.steps.toDouble();
    } else if (state is HealthSynced) {
      return isCalories ? state.data.calories : state.data.steps.toDouble();
    }
    return 0.0;
  }
}
