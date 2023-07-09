import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial());

  void toggleTheme() => emit(
        state.themeMode == ThemeMode.light
            ? const ThemeChanged(ThemeMode.dark)
            : const ThemeChanged(ThemeMode.light),
      );
}
