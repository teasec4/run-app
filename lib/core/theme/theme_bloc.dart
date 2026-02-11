import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'is_dark_theme';

  ThemeBloc() : super(const ThemeInitial()) {
    on<InitThemeEvent>(_onInitTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  Future<void> _onInitTheme(
    InitThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(_themeKey) ?? false;
      emit(ThemeChanged(isDark));
    } catch (e) {
      emit(const ThemeInitial());
    }
  }

  Future<void> _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      emit(ThemeLoading(event.isDark));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, event.isDark);
      emit(ThemeChanged(event.isDark));
    } catch (e) {
      emit(ThemeChanged(event.isDark));
    }
  }
}
