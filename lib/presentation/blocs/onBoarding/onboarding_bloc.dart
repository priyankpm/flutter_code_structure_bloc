import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/core/storage/splash_redirection_storage.dart';
import 'package:project_structure_bloc/domain/useCases/onboarding_use_case.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_event.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingUseCase onboardingUseCase;
  final SplashRedirectionStorage splashRedirectionStorage;

  OnboardingBloc(this.onboardingUseCase, this.splashRedirectionStorage)
    : super(OnboardingState()) {
    on<FetchOnBoardingDetails>((event, emit) {
      emit(state.copyWith(onBoardingItem: onboardingUseCase.onBoardingData));
    });
    on<ChangeItemOnNextEvent>((event, emit) {
      onboardingUseCase.currentItem = event.currentIndex;
      emit(state.copyWith(index: onboardingUseCase.currentItem));
    });

    on<OnboardingNextPressed>((event, emit) async {
      if (state.index == (state.onBoardingItem?.length ?? 0) - 1) {
        await splashRedirectionStorage.setOnBoarding(true);
        emit(state.copyWith(redirectHomeScreen: true));
      } else {
        final next = (state.index + 1).clamp(
          0,
          (state.onBoardingItem?.length ?? 0) - 1,
        );
        emit(state.copyWith(index: next));
      }
    });
    on<OnboardingCompleted>((event, emit) async {
      await splashRedirectionStorage.setOnBoarding(true);
      emit(state.copyWith(redirectHomeScreen: true));
    });
  }
}
