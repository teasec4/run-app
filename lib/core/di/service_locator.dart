import 'package:get_it/get_it.dart';
import '../localization/locale_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Blocs
  getIt.registerSingleton<LocaleBloc>(LocaleBloc());
}
