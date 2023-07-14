part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ChangeTheme extends ThemeEvent {
  @override
  List<Object?> get props => [];
}