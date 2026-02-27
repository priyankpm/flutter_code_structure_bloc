import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/common/buttons/common_back_button.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool isLeading;
  final List<Widget>? actions;
  final void Function()? onTap;
  final Widget? titleWidget;

  const CommonAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.isLeading = true,
    this.actions,
    this.onTap,
    this.titleWidget,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.1,
      elevation: 0.1,
      shadowColor: AppColors.blackColor,
      titleSpacing: 10,
      title: Row(
        children: [
          !isLeading
              ? SizedBox(width: Spacing.small + 2)
              : CommonBackButton(onTap: onTap),
          titleWidget ??
              Text(
                title,
                style: AppTextStyle().commonTextStyle(
                  appFontStyle: AppFontStyle.semibold,
                  fontSize: 18,
                  textColor: AppColors.textPrimaryColor,
                ),
              ),
        ],
      ),
      centerTitle: centerTitle,
      backgroundColor: AppColors.appbarBgColor,
      leading: SizedBox(),
      leadingWidth: 0,
      actions: actions ?? [],
    );
  }
}
