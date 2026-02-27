import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_event.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_state.dart';
import 'package:project_structure_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/theme/theme_event.dart';
import 'package:project_structure_bloc/presentation/blocs/theme/theme_state.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/enum.dart';

import 'widget/custom_bottom_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            final List<Widget> screens = [
              Center(child: CommonText(string: 'Home Screen')),
              Center(child: CommonText(string: 'Upgrade Screen')),
              Center(child: CommonText(string: 'Profile Screen')),
            ];

            return Scaffold(
              key: ValueKey(themeState.themeName),
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.appbarBgColor,
                title: CommonText(
                  string: 'Dashboard',
                  color: AppColors.textPrimaryColor,
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      themeState.themeName == UsedTheme.darkTheme.name
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      context.read<ThemeBloc>().add(ToggleTheme());
                    },
                  ),
                ],
              ),
              body: screens[state.selectedIndex],
              bottomNavigationBar: CustomBottomBar(
                currentIndex: state.selectedIndex,
                onTabSelected: (index) async {
                  context.read<DashboardBloc>().add(DashboardTabChanged(index));
                },
              ),
            );
          },
        );
      },
    );
  }
}
