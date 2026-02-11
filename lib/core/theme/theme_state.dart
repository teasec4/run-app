import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState(this.isDark);

  @override
  List<Object> get props => [isDark];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(false);
}

class ThemeLoading extends ThemeState {
  const ThemeLoading(super.isDark);
}

class ThemeChanged extends ThemeState {
  const ThemeChanged(super.isDark);
}
