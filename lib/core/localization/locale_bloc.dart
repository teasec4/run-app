import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const String _localeKey = 'selected_locale';

  LocaleBloc() : super(const LocaleInitial()) {
    on<InitLocaleEvent>(_onInitLocale);
    on<ChangeLocaleEvent>(_onChangeLocale);
  }

  Future<void> _onInitLocale(
    InitLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLocaleCode = prefs.getString(_localeKey);

      if (savedLocaleCode != null) {
        final parts = savedLocaleCode.split('_');
        final locale = Locale(parts[0], parts.length > 1 ? parts[1] : null);
        emit(LocaleChanged(locale));
      } else {
        emit(const LocaleInitial());
      }
    } catch (e) {
      emit(const LocaleInitial());
    }
  }

  Future<void> _onChangeLocale(
    ChangeLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    try {
      emit(LocaleLoading(event.locale));
      final prefs = await SharedPreferences.getInstance();
      final localeCode =
          '${event.locale.languageCode}_${event.locale.countryCode ?? ''}';
      await prefs.setString(_localeKey, localeCode);
      emit(LocaleChanged(event.locale));
    } catch (e) {
      emit(LocaleChanged(event.locale));
    }
  }
}
