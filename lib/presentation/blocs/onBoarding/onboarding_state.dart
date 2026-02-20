import 'package:equatable/equatable.dart';
import 'package:project_structure_bloc/domain/entities/slider_item_model.dart';

class OnboardingState extends Equatable {
  final int index;
  final List<SliderItemModel>? onBoardingItem;
  final bool redirectHomeScreen;

  const OnboardingState({
    this.index = 0,
    this.onBoardingItem,
    this.redirectHomeScreen = false,
  });

  OnboardingState copyWith({
    int? index,
    List<SliderItemModel>? onBoardingItem,
    bool? redirectHomeScreen,
  }) {
    return OnboardingState(
      index: index ?? this.index,
      onBoardingItem: onBoardingItem ?? this.onBoardingItem,
      redirectHomeScreen: redirectHomeScreen ?? this.redirectHomeScreen,
    );
  }

  @override
  List<Object?> get props => [index, onBoardingItem, redirectHomeScreen];
}
