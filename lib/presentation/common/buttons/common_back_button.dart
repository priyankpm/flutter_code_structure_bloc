import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
    this.iconColor,
    this.icon,
    this.iconSize,
    this.onTap,
  });

  final Color? iconColor;
  final IconData? icon;
  final double? iconSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            AppNavigator.pop();
          },
      child: Container(
        color: Colors.transparent,
        height: 32,
        width: 32,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            icon ?? Icons.arrow_back_ios,
            color: iconColor ?? AppColors.textPrimaryColor,
            size: iconSize ?? 22,
          ),
        ),
      ),
    );
  }
}
