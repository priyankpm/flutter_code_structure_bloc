import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/app_preference.dart';
import 'package:project_structure_bloc/presentation/utils/enum.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppPreference.getUsedThemeName())) {
    on<ThemeChanged>((event, emit) async {
      await AppColors.changeThemeColor(usedTheme: event.themeName);
      emit(ThemeState(event.themeName));
    });

    on<ToggleTheme>((event, emit) async {
      final currentTheme = state.themeName;
      final newTheme = (currentTheme == UsedTheme.darkTheme.name)
          ? UsedTheme.lightTheme.name
          : UsedTheme.darkTheme.name;
      
      await AppColors.changeThemeColor(usedTheme: newTheme);
      emit(ThemeState(newTheme));
    });
  }
}
