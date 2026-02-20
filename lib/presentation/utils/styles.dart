import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';

enum AppFontStyle { light, regular, medium, semibold, bold, heavy, black }

extension AppFontStyleExtension on AppFontStyle {
  String get fontFamily => 'SF-Pro';

  FontWeight get fontWeight {
    switch (this) {
      case AppFontStyle.light:
        return FontWeight.w300;
      case AppFontStyle.regular:
        return FontWeight.w400;
      case AppFontStyle.medium:
        return FontWeight.w500;
      case AppFontStyle.semibold:
        return FontWeight.w600;
      case AppFontStyle.bold:
        return FontWeight.w700;
      case AppFontStyle.heavy:
        return FontWeight.w800;
      case AppFontStyle.black:
        return FontWeight.w900;
    }
  }

  static AppFontStyle fromString(String value) {
    switch (value.toLowerCase()) {
      case 'light':
        return AppFontStyle.light;
      case 'regular':
        return AppFontStyle.regular;
      case 'medium':
        return AppFontStyle.medium;
      case 'semibold':
        return AppFontStyle.semibold;
      case 'bold':
        return AppFontStyle.bold;
      case 'heavy':
        return AppFontStyle.bold;
      case 'black':
        return AppFontStyle.black;
      default:
        return AppFontStyle.regular;
    }
  }
}

class AppTextStyle {
  TextStyle commonTextStyle({
    double? fontSize,
    Color? textColor,
    AppFontStyle? appFontStyle,
    TextDecoration? decoration,
    Color? decorationColor,
    double? height,
  }) {
    final style = AppFontStyleExtension.fromString(
      appFontStyle?.name ?? 'medium',
    );
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontFamily: style.fontFamily,
      fontWeight: style.fontWeight,
      color: textColor ?? AppColors.textPrimaryColor,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
    );
  }
}

String emoji(String flag) {
  final first = flag.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final second = flag.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(first) + String.fromCharCode(second);
}
