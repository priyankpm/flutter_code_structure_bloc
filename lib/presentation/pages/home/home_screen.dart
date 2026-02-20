import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Text("Home Screen")),
    );
  }
}
