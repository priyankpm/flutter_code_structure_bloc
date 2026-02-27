import 'package:flutter/material.dart';
import 'package:project_structure_bloc/presentation/common/icon_view/common_icon_view.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/asset.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? errorMessage;
  bool? isCenter;

  ErrorTextWidget({super.key, this.errorMessage, this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (isCenter ?? false)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      crossAxisAlignment: (isCenter ?? false)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SvgIconView(icon: IconAsset.errorIcon, size: Spacing.normal),
        Spacing.width5(),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: "$errorMessage ",
              style: TextStyle(
                color: AppColors.redColor,
                fontWeight: FontWeight.w500,
                fontSize: Spacing.normal,
              ),
              // children: [
              //   TextSpan(
              //     text: S.of(context).tryAgain,
              //     style: TextStyle(
              //       color: AppColors.redColor,
              //       decoration: TextDecoration.underline,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 15.sp,
              //     ),
              //   ),
              // ],
            ),
          ),
        ),
      ],
    );
  }
}
