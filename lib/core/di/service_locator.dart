import 'package:get_it/get_it.dart';
import '../localization/locale_bloc.dart';
import '../storage/goals_storage.dart';
import '../../features/runner_profile/data/health_kit_repository.dart';
import '../../features/runner_profile/presentation/bloc/health_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Storage
  getIt.registerSingleton<GoalsStorage>(GoalsStorage());

  // Repositories
  getIt.registerSingleton<HealthKitRepository>(HealthKitRepository());

  // Blocs
  getIt.registerSingleton<LocaleBloc>(LocaleBloc());
  getIt.registerSingleton<HealthBloc>(
    HealthBloc(getIt<HealthKitRepository>()),
  );
}
