import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_event.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_state.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Kick off the splash flow once the widget is mounted.
    context.read<SplashBloc>().add(SplashStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToOnboarding) {
            AppNavigator.go(AppRoutes.onBoardingScreen);
          } else if (state is SplashNavigateToLogin) {
            AppNavigator.go(AppRoutes.loginScreen);
          } else if (state is SplashNavigateToHome) {
            AppNavigator.go(AppRoutes.homeScreen);
          }
        },
        child: Center(
          child: Text(
            S.of(context).splashScreen,
            style: AppTextStyle().commonTextStyle(),
          ),
        ),
      ),
    );
  }
}
