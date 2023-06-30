part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  const ThemeState(this.themeMode);
  final ThemeMode themeMode;
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(ThemeMode.light);
}

class ThemeChanged extends ThemeState {
  const ThemeChanged(ThemeMode themeMode) : super(themeMode);
}
