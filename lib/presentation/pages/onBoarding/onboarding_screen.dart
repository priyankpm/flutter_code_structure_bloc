import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/core/di/injection.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_event.dart';
import 'package:project_structure_bloc/presentation/pages/onBoarding/base/page_view_item.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocProvider(
        create: (context) =>
            OnboardingBloc(sl(),sl())..add(FetchOnBoardingDetails()),
        child: PageViewItem(),
      ),
    );
  }
}
