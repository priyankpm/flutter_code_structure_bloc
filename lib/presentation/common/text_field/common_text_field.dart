import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/common/error_view/error_text_widget.dart';
import 'package:project_structure_bloc/presentation/common/icon_view/common_icon_view.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/asset.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

class CommonTextField extends StatefulWidget {
  final bool readOnly;
  final TextEditingController controller;
  final int maxLine;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final int? maxLength;
  final double? radius;
  final bool enabled;
  final bool useMaxLine;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? hintText;
  final TextAlign? textAlign;
  final Widget? prefix;
  final Widget? suffix;
  final String? labelText;
  final String? errorMessage;
  final VoidCallback? onTap;
  final Function(String?)? onSave;
  final Color? enableColor;
  final Color? focusedColor;
  final Color? fillColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  CommonTextField({
    super.key,
    this.onChanged,
    this.maxLine = 1,
    this.useMaxLine = true,
    this.maxLength,
    this.radius,
    this.labelText = "",
    this.isPassword = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.hintText,
    this.textAlign,
    this.fillColor,
    this.prefix,
    this.suffix,
    this.onTap,
    this.enableColor,
    this.focusedColor,
    this.cursorColor,
    required this.controller,
    this.contentPadding,
    this.prefixWidget,
    this.suffixWidget,
    this.errorMessage,
    this.readOnly = false,
    this.onSave,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.labelText != null && (widget.labelText?.isNotEmpty ?? false))
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: CommonText(
              string: widget.labelText ?? "",
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: AppColors.textPrimaryColor,
            ),
          ),
        ValueListenableBuilder(
          valueListenable: _isObscure,
          builder: (context, bool isObscure, _) {
            if (!widget.isPassword) {
              isObscure = false;
            }
            return IntrinsicHeight(
              child: TextFormField(
                onSaved: widget.onSave,
                readOnly: widget.readOnly,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Spacing.medium,
                  color: AppColors.textPrimaryColor,
                  letterSpacing: 0.5,
                ),
                onTap: widget.onTap,
                obscureText: isObscure,
                obscuringCharacter: '*',
                onChanged: widget.onChanged,
                controller: widget.controller,
                maxLines: widget.useMaxLine ? widget.maxLine : null,
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                focusNode: widget.focusNode,
                cursorColor: widget.cursorColor,
                textAlign: widget.textAlign ?? TextAlign.start,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  prefix: widget.prefixWidget,
                  suffix: widget.suffixWidget,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(horizontal: Spacing.medium, vertical: Spacing.normal),
                  isDense: true,
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix == null && widget.isPassword
                      ? GestureDetector(
                          onTap: () {
                            _isObscure.value = !isObscure;
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Spacing.medium,
                              vertical: Spacing.medium,
                            ),
                            child: SvgIconView(
                              icon: !isObscure
                                  ? IconAsset.eyeShow
                                  : IconAsset.eyeHide,
                            ),
                          ),
                        )
                      : widget.suffix,
                  counterText: "",
                  // contentPadding: const EdgeInsets.all(12),
                  hintText: widget.hintText,
                  hintStyle: AppTextStyle().commonTextStyle(
                    textColor: AppColors.textPrimaryColor,
                    fontSize: 13,
                    appFontStyle: AppFontStyle.medium,
                  ),
                  error:
                      (widget.errorMessage != null &&
                          (widget.errorMessage?.isNotEmpty ?? false))
                      ? ErrorTextWidget(errorMessage: widget.errorMessage)
                      : null,
                  filled: true,
                  fillColor: widget.fillColor ?? AppColors.cardBgColor,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? 50),
                    ),
                    borderSide: BorderSide(color: AppColors.cardBgColor2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? 50),
                    ),
                    borderSide: BorderSide(
                      color: widget.enableColor ?? AppColors.cardBgColor2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? 50),
                    ),
                    borderSide: BorderSide(
                      color: widget.focusedColor ?? AppColors.cardBgColor2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? 50),
                    ),
                    borderSide: BorderSide(color: AppColors.textPrimaryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? 50),
                    ),
                    borderSide: BorderSide(color: AppColors.redColor),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
