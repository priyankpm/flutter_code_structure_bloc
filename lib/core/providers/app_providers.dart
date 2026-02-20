import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/core/di/injection.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_bloc.dart';

class AppProviders {
  static List<BlocProvider> get providers => [
    BlocProvider<SplashBloc>(create: (context) => SplashBloc(sl())),
    BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc(sl(),sl())),
  ];
}
