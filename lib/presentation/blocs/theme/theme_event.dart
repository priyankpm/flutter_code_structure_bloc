import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final String themeName;

  const ThemeChanged(this.themeName);

  @override
  List<Object> get props => [themeName];
}

class ToggleTheme extends ThemeEvent {}
