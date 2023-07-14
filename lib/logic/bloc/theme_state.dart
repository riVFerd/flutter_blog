part of 'theme_bloc.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState(this.themeMode);
  final ThemeMode themeMode;
}

class ThemeLight extends ThemeState {
  const ThemeLight() : super(ThemeMode.light);
  
  @override
  List<Object?> get props => [themeMode];
}

class ThemeDark extends ThemeState {
  const ThemeDark() : super(ThemeMode.dark);
  
  @override
  List<Object?> get props => [themeMode];
}
