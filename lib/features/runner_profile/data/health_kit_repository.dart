import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'health_data_model.dart';

class HealthKitRepository {
  final Health _health = Health();

  // Запросить permission у пользователя
  Future<bool> requestHealthAuthorization() async {
    try {
      debugPrint('⏳ Requesting HealthKit authorization...');
      
      final types = <HealthDataType>[
        HealthDataType.STEPS,
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ];

      final permissions = <HealthDataAccess>[
        HealthDataAccess.READ,
        HealthDataAccess.READ,
      ];

      debugPrint('📱 Types to request: $types');
      debugPrint('📋 Permissions: $permissions');

      final authorized = await _health.requestAuthorization(
        types,
        permissions: permissions,
      );

      debugPrint('✅ Authorization result: $authorized');
      return authorized;
    } catch (e) {
      debugPrint('❌ Error requesting health authorization: $e');
      return false;
    }
  }

  // Получить данные за сегодня (с полуночи до полуночи)
  Future<HealthData> getHealthDataToday() async {
    try {
      debugPrint('📊 Fetching health data for today (00:00 - 23:59)...');
      
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      // Получаем шаги
      debugPrint('🚶 Fetching steps from $startOfDay to $endOfDay');
      var stepsData = await _health.getHealthDataFromTypes(
        types: <HealthDataType>[HealthDataType.STEPS],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      debugPrint('📈 Got ${stepsData.length} step records (before dedup)');
      
      // Удаляем дубли
      stepsData = _health.removeDuplicates(stepsData);
      debugPrint('📈 Got ${stepsData.length} step records (after dedup)');
      
      // Логируем каждую запись
      for (var i = 0; i < stepsData.length; i++) {
        final data = stepsData[i];
        if (data.value is NumericHealthValue) {
          final value = data.value as NumericHealthValue;
          debugPrint('  [$i] Source: ${data.sourceName}, Steps: ${value.numericValue}, Time: ${data.dateFrom} - ${data.dateTo}');
        }
      }

      // Получаем калории
      debugPrint('🔥 Fetching calories from $startOfDay to $endOfDay');
      var caloriesData = await _health.getHealthDataFromTypes(
        types: <HealthDataType>[HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      debugPrint('📈 Got ${caloriesData.length} calorie records (before dedup)');
      
      // Удаляем дубли
      caloriesData = _health.removeDuplicates(caloriesData);
      debugPrint('📈 Got ${caloriesData.length} calorie records (after dedup)');
      
      // Логируем каждую запись калорий
      for (var i = 0; i < caloriesData.length; i++) {
        final data = caloriesData[i];
        if (data.value is NumericHealthValue) {
          final value = data.value as NumericHealthValue;
          debugPrint('  [$i] Source: ${data.sourceName}, Calories: ${value.numericValue}, Time: ${data.dateFrom} - ${data.dateTo}');
        }
      }

      int totalSteps = 0;
      double totalCalories = 0.0;

      // Суммируем шаги (NumericHealthValue)
      for (var data in stepsData) {
        try {
          if (data.value is NumericHealthValue) {
            final value = data.value as NumericHealthValue;
            totalSteps += value.numericValue.toInt();
          }
        } catch (e) {
          debugPrint('Error parsing step value: $e');
        }
      }

      // Суммируем калории (NumericHealthValue)
      for (var data in caloriesData) {
        try {
          if (data.value is NumericHealthValue) {
            final value = data.value as NumericHealthValue;
            totalCalories += value.numericValue;
          }
        } catch (e) {
          debugPrint('Error parsing calorie value: $e');
        }
      }

      debugPrint('✅ Total steps: $totalSteps, Total calories: $totalCalories');

      return HealthData(
        steps: totalSteps,
        calories: totalCalories,
        lastSyncTime: DateTime.now(),
      );
    } catch (e) {
      debugPrint('❌ Error getting health data: $e');
      rethrow;
    }
  }

  // Получить данные за период
  Future<HealthData> getHealthDataForPeriod({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      var stepsData = await _health.getHealthDataFromTypes(
        types: <HealthDataType>[HealthDataType.STEPS],
        startTime: startDate,
        endTime: endDate,
      );
      stepsData = _health.removeDuplicates(stepsData);

      var caloriesData = await _health.getHealthDataFromTypes(
        types: <HealthDataType>[HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: startDate,
        endTime: endDate,
      );
      caloriesData = _health.removeDuplicates(caloriesData);

      int totalSteps = 0;
      double totalCalories = 0.0;

      for (var data in stepsData) {
        try {
          if (data.value is NumericHealthValue) {
            final value = data.value as NumericHealthValue;
            totalSteps += value.numericValue.toInt();
          }
        } catch (e) {
          debugPrint('Error parsing step value: $e');
        }
      }

      for (var data in caloriesData) {
        try {
          if (data.value is NumericHealthValue) {
            final value = data.value as NumericHealthValue;
            totalCalories += value.numericValue;
          }
        } catch (e) {
          debugPrint('Error parsing calorie value: $e');
        }
      }

      return HealthData(
        steps: totalSteps,
        calories: totalCalories,
        lastSyncTime: DateTime.now(),
      );
    } catch (e) {
      debugPrint('Error getting health data for period: $e');
      rethrow;
    }
  }

  // Проверить есть ли access к Health
  Future<bool> hasHealthAccess() async {
    try {
      debugPrint('🔍 Checking if app has HealthKit access...');
      
      final types = <HealthDataType>[
        HealthDataType.STEPS,
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ];

      // Try to get data for today - if it works, we have access
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
      
      debugPrint('📅 Checking data from: $startOfDay to $endOfDay');
      
      await _health.getHealthDataFromTypes(
        types: types,
        startTime: startOfDay,
        endTime: now,
      );

      debugPrint('✅ App has HealthKit access');
      return true;
    } catch (e) {
      debugPrint('⚠️ App does NOT have HealthKit access: $e');
      return false;
    }
  }
}
