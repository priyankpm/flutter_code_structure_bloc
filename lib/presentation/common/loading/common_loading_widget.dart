import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';

class CommonLoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool useCenter;
  final double? strokeWidth;
  final EdgeInsetsGeometry? padding;

  const CommonLoadingWidget({
    super.key,
    this.color,
    this.padding,
    this.size,
    this.useCenter = true,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return useCenter
        ? Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth ?? 3,
            color: color ?? AppColors.primaryColor,
          ),
        ),
      ),
    )
        : SizedBox(
      width: size,
      height: size,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 3,
          color: color ?? AppColors.primaryColor,
        ),
      ),
    );
  }
}