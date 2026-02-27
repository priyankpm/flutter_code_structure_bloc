import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';

class SvgIconView extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final bool useColor;
  final Function()? onTap;

  const SvgIconView({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.onTap,
    this.useColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        height: size ?? Spacing.xLarge,
        width: size ?? Spacing.xLarge,
        color: (useColor) ? (color ?? AppColors.textPrimaryColor) : null,
      ),
    );
  }
}
