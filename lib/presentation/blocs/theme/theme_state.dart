import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final String themeName;

  const ThemeState(this.themeName);

  @override
  List<Object> get props => [themeName];
}
