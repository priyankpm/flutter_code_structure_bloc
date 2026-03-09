import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract interface class Spacing {
  static double none = 0;
  static double xxSmall = 2.w;
  static double xSmall = 4.w;
  static double small = 8.w;
  static double medium = 12.w;
  static double normal = 16.w;
  static double large = 20.w;
  static double xLarge = 24.w;
  static double xxLarge = 32.w;
  static double xxxLarge = 40.w;
  static double xxxxLarge = 56.w;

  static SizedBox height5() => SizedBox(height: 5.h);
  static SizedBox height8() => SizedBox(height: 8.h);
  static SizedBox height10() => SizedBox(height: 10.h);
  static SizedBox height15() => SizedBox(height: 15.h);
  static SizedBox height100() => SizedBox(height: 100.h);
  static SizedBox height20() => SizedBox(height: 20.h);
  static SizedBox height30() => SizedBox(height: 30.h);
  static SizedBox height50() => SizedBox(height: 50.h);
  static SizedBox width5() => SizedBox(width: 5.w);
  static SizedBox width10() => SizedBox(width: 10.w);
  static SizedBox width20() => SizedBox(width: 20.w);
  static SizedBox customHeight(double height) => SizedBox(height: height.h);
}

abstract interface class RadiusValues {
  static Radius none = const Radius.circular(0);
  static Radius xSmall = Radius.circular(4.r);
  static Radius small = Radius.circular(8.r);
  static Radius medium = Radius.circular(12.r);
  static Radius normal = Radius.circular(16.r);
  static Radius large = Radius.circular(20.r);
  static Radius xLarge = Radius.circular(24.r);
  static Radius xxLarge = Radius.circular(32.r);
  static Radius xxxLarge = Radius.circular(40.r);
}

abstract interface class ShapeBorderRadius {
  static BorderRadius none = BorderRadius.all(RadiusValues.none);
  static BorderRadius xSmall = BorderRadius.all(RadiusValues.xSmall);
  static BorderRadius small = BorderRadius.all(RadiusValues.small);
  static BorderRadius medium = BorderRadius.all(RadiusValues.medium);
  static BorderRadius normal = BorderRadius.all(RadiusValues.normal);
  static BorderRadius large = BorderRadius.all(RadiusValues.large);
  static BorderRadius xLarge = BorderRadius.all(RadiusValues.xLarge);
  static BorderRadius xxLarge = BorderRadius.all(RadiusValues.xxLarge);
  static BorderRadius xxxLarge = BorderRadius.all(RadiusValues.xxxLarge);
}

abstract class PaddingValue {
  static EdgeInsetsDirectional zero = EdgeInsetsDirectional.zero;
  static EdgeInsetsDirectional xSmall = EdgeInsetsDirectional.all(Spacing.xSmall);
  static EdgeInsetsDirectional small = EdgeInsetsDirectional.all(Spacing.small);
  static EdgeInsetsDirectional medium = EdgeInsetsDirectional.all(Spacing.medium);
  static EdgeInsetsDirectional normal = EdgeInsetsDirectional.all(Spacing.normal);
  static EdgeInsetsDirectional large = EdgeInsetsDirectional.all(Spacing.large);
  static EdgeInsetsDirectional xLarge = EdgeInsetsDirectional.all(Spacing.xLarge);
  static EdgeInsetsDirectional xxLarge = EdgeInsetsDirectional.all(Spacing.xxLarge);
}

