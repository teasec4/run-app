import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class InitThemeEvent extends ThemeEvent {
  const InitThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final bool isDark;

  const ChangeThemeEvent(this.isDark);

  @override
  List<Object> get props => [isDark];
}
