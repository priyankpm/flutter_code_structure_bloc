import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_structure_bloc/presentation/common/loading/common_loading_widget.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/utils.dart';

class CommonButton extends StatefulWidget {
  final double? height;
  final VoidCallback? onTap;
  final double? width;
  final double? fontSize;
  final double? size;
  final double? endSvgSize;
  final double? borderWidth;
  final FontWeight? fontWeight;
  final String? text;
  final bool useIconColor;
  final String? svg;
  final String? endSvg;
  final Color? buttonColor;
  final Color? disableButtonColor;
  final Color? buttonBorderColor;
  final Color? loaderColor;
  final Color? textColor;
  final Color? disableTextColor;
  final bool needBorderColor;
  final bool isDisabled;
  final bool isLoader;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final CrossAxisAlignment? crossAxisAlignment;

  const CommonButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.svg,
    this.endSvg,
    this.useIconColor = true,
    this.buttonBorderColor,
    this.loaderColor,
    this.buttonColor,
    this.fontWeight,
    this.fontSize,
    this.borderWidth,
    this.endSvgSize,
    this.textColor,
    this.size,
    this.onTap,
    this.padding,
    this.isDisabled = false,
    this.isLoader = false,
    this.disableButtonColor,
    this.disableTextColor,
    this.margin,
    this.needBorderColor = true,
    this.crossAxisAlignment = CrossAxisAlignment.end,
    this.borderRadius,
  });

  @override
  CommonButtonState createState() => CommonButtonState();
}

class CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    final buttonButton = (widget.isDisabled)
        ? widget.disableButtonColor ?? AppColors.whiteColor
        : widget.buttonColor ?? AppColors.primaryColor;
    return GestureDetector(
      onTap: (widget.isLoader || widget.isDisabled)
          ? null
          : () {
              Utils.onHapticFeedbackImpact();
              widget.onTap?.call();
            },
      child: AnimatedContainer(
        duration: AppConstant.kAnimationDuration200,
        height: widget.height,
        width: widget.width,
        padding:
            widget.padding ?? EdgeInsets.symmetric(vertical: Spacing.medium),
        margin: widget.margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(13),
          color: buttonButton,
          border: Border.all(
            color: widget.buttonBorderColor ?? buttonButton,
            width: widget.borderWidth ?? 1,
          ),
        ),
        child: Center(
          child: widget.isLoader
              ? CommonLoadingWidget(
                  color:
                      widget.loaderColor ??
                      ((buttonButton == AppColors.whiteColor ||
                              buttonButton == Colors.white)
                          ? Colors.black
                          : Colors.white),
                  size: widget.size ?? Spacing.xLarge,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      widget.crossAxisAlignment ?? CrossAxisAlignment.end,
                  children: [
                    if (widget.svg != null)
                      Row(
                        children: [
                          SvgPicture.asset(
                            widget.svg!,
                            color: widget.useIconColor
                                ? ((widget.isDisabled)
                                      ? widget.disableTextColor ??
                                            AppColors.textSecondaryColor
                                      : widget.textColor ??
                                            AppColors.textPrimaryColor)
                                : null,
                            height: Spacing.xLarge,
                            width: Spacing.xLarge,
                          ),
                          SizedBox(width: Spacing.small),
                        ],
                      ),
                    CommonText(
                      string: widget.text ?? "",
                      fontSize: widget.fontSize ?? 16,
                      fontWeight: widget.fontWeight ?? FontWeight.w500,
                      color: (widget.isDisabled)
                          ? widget.disableTextColor ??
                                AppColors.textSecondaryColor
                          : widget.textColor ?? AppColors.textPrimaryColor,
                    ),
                    if (widget.endSvg != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: Spacing.small),
                          Padding(
                            padding: .symmetric(vertical: Spacing.xxSmall),
                            child: SvgPicture.asset(
                              widget.endSvg!,
                              color: widget.useIconColor
                                  ? ((widget.isDisabled)
                                        ? widget.disableTextColor ??
                                              AppColors.textSecondaryColor
                                        : widget.textColor ??
                                              AppColors.textPrimaryColor)
                                  : null,
                              height: Spacing.xLarge,
                              width: Spacing.xLarge,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
