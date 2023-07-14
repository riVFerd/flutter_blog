import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeLight()) {
    on<ChangeTheme>((event, emit) {
      if (state is ThemeLight) {
        emit(const ThemeDark());
      } else {
        emit(const ThemeLight());
      }
    });
  }
}
