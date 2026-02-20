import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_event.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_state.dart';
import 'package:project_structure_bloc/presentation/common/buttons/common_button.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({super.key});

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  context.read<OnboardingBloc>().add(
                    ChangeItemOnNextEvent(value),
                  );
                },
                itemCount: state.onBoardingItem?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = state.onBoardingItem?[index];
                  return Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        item?.title ?? '',
                        style: AppTextStyle().commonTextStyle(
                          fontSize: Spacing.normal,
                        ),
                      ),
                      Text(
                        item?.subTitle ?? '',
                        style: AppTextStyle().commonTextStyle(
                          fontSize: Spacing.medium,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            BlocListener<OnboardingBloc, OnboardingState>(
              listener: (context, state) {
                if (state.redirectHomeScreen) {
                  AppNavigator.go(AppRoutes.homeScreen);
                } else {
                  _pageController.animateToPage(
                    state.index,
                    duration: AppConstant.kAnimationDuration300,
                    curve: Curves.ease,
                  );
                }
              },
              child: Padding(
                padding: .symmetric(horizontal: 12, vertical: 8),
                child: CommonButton(
                  onTap: () {
                    context.read<OnboardingBloc>().add(OnboardingNextPressed());
                  },
                  text: state.index == 2
                      ? S.of(context).getStarted
                      : S.of(context).next,
                  textColor: AppColors.cardBgColor2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
