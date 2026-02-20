import 'package:project_structure_bloc/domain/entities/slider_item_model.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';

class OnboardingUseCase {
  int currentItem = 0;
  List<SliderItemModel> onBoardingData = [
    SliderItemModel(
      S.of(AppConstant.globalCtx).boardingTitle1,
      S.of(AppConstant.globalCtx).boardingSubTitle1,
    ),
    SliderItemModel(
      S.of(AppConstant.globalCtx).boardingTitle2,
      S.of(AppConstant.globalCtx).boardingSubTitle2,
    ),
    SliderItemModel(
      S.of(AppConstant.globalCtx).boardingTitle3,
      S.of(AppConstant.globalCtx).boardingSubTitle3,
    ),
  ];
}
