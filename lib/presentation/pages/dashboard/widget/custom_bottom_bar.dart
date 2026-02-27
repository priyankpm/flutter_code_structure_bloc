import 'package:flutter/material.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/presentation/common/icon_view/common_icon_view.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/asset.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<_TabItem> tabs = [
      _TabItem(
        label: S.of(context).home,
        selectedImage: IconAsset.homeIcon,
        unselectedImage: IconAsset.homeIcon,
      ),
      _TabItem(
        label: S.of(context).upgrade,
        selectedImage: IconAsset.upgradeIcon,
        unselectedImage: IconAsset.upgradeIcon,
      ),
      _TabItem(
        label: S.of(context).profile,
        selectedImage: IconAsset.accountIcon,
        unselectedImage: IconAsset.accountIcon,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.appbarBgColor,
        border: Border.all(color: AppColors.borderColor, width: 0.5),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.medium,
        horizontal: Spacing.xSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final isSelected = currentIndex == index;
          final item = tabs[index];
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgIconView(
                    icon: isSelected
                        ? item.selectedImage
                        : item.unselectedImage,
                    size: 25,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: AppTextStyle().commonTextStyle(
                      textColor: isSelected
                          ? AppColors.primaryColor
                          : AppColors.textDefaultColor,
                      appFontStyle: AppFontStyle.medium,
                      fontSize: 13,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      height: Spacing.xSmall,
                      width: Spacing.xSmall,
                      color: AppColors.redColor,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _TabItem {
  final String label;
  final String selectedImage;
  final String unselectedImage;

  _TabItem({
    required this.label,
    required this.selectedImage,
    required this.unselectedImage,
  });
}
