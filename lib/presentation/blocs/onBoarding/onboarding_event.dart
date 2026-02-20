import 'package:equatable/equatable.dart';

sealed class OnboardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchOnBoardingDetails extends OnboardingEvent {}

class ChangeItemOnNextEvent extends OnboardingEvent {
  final int currentIndex;

  ChangeItemOnNextEvent(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

class OnboardingNextPressed extends OnboardingEvent {}

class OnboardingCompleted extends OnboardingEvent {}
