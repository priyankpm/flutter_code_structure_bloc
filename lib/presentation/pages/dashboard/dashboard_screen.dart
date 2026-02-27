import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_event.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_state.dart';

import 'widget/custom_bottom_bar.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});

  final List<Widget> _screens = const [
    Center(child: Text('Home Screen')),
    Center(child: Text('Upgrade Screen')),
    Center(child: Text('Profile Screen')),
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: _colors[state.selectedIndex],
          body: _screens[state.selectedIndex],
          bottomNavigationBar: CustomBottomBar(
            currentIndex: state.selectedIndex,
            onTabSelected: (index) async {
              context.read<DashboardBloc>().add(DashboardTabChanged(index));
            },
          ),
        );
      },
    );
  }
}
