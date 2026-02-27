import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_structure_bloc/presentation/common/icon_view/common_icon_view.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';
import 'package:project_structure_bloc/presentation/utils/asset.dart';
import 'package:project_structure_bloc/presentation/utils/enum.dart';
import 'package:project_structure_bloc/presentation/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class CustomCacheNetworkImageView extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape? shape;
  final BoxFit? fit;
  final double? errorIconSize;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;
  final EdgeInsetsGeometry? errorIconPadding;
  final Widget? noImageView;

  const CustomCacheNetworkImageView({
    super.key,
    required this.imageUrl,
    this.height,
    this.maxHeightDiskCache,
    this.maxWidthDiskCache,
    this.width,
    this.border,
    this.shape,
    this.borderRadius,
    this.fit,
    this.errorIconSize,
    this.errorIconPadding,
    this.noImageView,
  });

  @override
  Widget build(BuildContext context) {
    return getImageFromPath(Utils.getImageType(imageUrl));
  }

  Widget getImageFromPath(ImagePathType imagePathType) {
    if (imageUrl.isEmpty) {
      return noImageView ??
          CustomCacheNetworkImageView(
            imageUrl: kImageUrl,
            height: height,
            width: width,
            shape: shape,
            fit: fit,
            border: border,
            noImageView: noImageView,
            maxWidthDiskCache: maxWidthDiskCache,
            maxHeightDiskCache: maxHeightDiskCache,
            errorIconSize: errorIconSize,
            errorIconPadding: errorIconPadding,
            borderRadius: borderRadius,
          );
    }
    /* if (imagePathType == ImagePathType.isNetworkVideo || imagePathType == ImagePathType.isFileVideo) {
      return VideoView(
        videoLink: imageUrl,
        width: width,
        height: height,
      );
    } else*/
    if (imagePathType == ImagePathType.isNetwork) {
      return CachedNetworkImage(
        imageUrl: imageUrl.isEmpty ? kImageUrl : imageUrl,
        height: height,
        width: width,
        cacheKey: imageUrl.isEmpty ? "CachedNetworkImage" : imageUrl,
        fit: fit ?? BoxFit.cover,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              border: border,
              borderRadius: borderRadius,
              image: DecorationImage(
                image: imageProvider,
                alignment: Alignment.center,
                fit: fit ?? BoxFit.cover,
              ),
            ),
          );
        },
        maxWidthDiskCache: maxWidthDiskCache,
        maxHeightDiskCache: maxHeightDiskCache,
        placeholder: (context, url) => _CacheNetworkImageLoadingShimmer(
          width: width,
          shape: shape,
          height: height,
          border: border,
          borderRadius: borderRadius,
        ),
        errorWidget: (context, url, error) =>
            noImageView ??
            CustomCacheNetworkImageView(
              imageUrl: kImageUrl,
              height: height,
              width: width,
              shape: shape,
              fit: fit,
              border: border,
              noImageView: noImageView,
              maxWidthDiskCache: maxWidthDiskCache,
              maxHeightDiskCache: maxHeightDiskCache,
              errorIconSize: errorIconSize,
              errorIconPadding: errorIconPadding,
              borderRadius: borderRadius,
            ),
      );
    } else if (imagePathType == ImagePathType.isSvg) {
      return SvgPicture.asset(imageUrl, height: height, width: width);
    } else if (imagePathType == ImagePathType.isAssets) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          border: border,
          borderRadius: borderRadius,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: fit ?? BoxFit.cover,
          ),
        ),
      );
    } else if (imagePathType == ImagePathType.isFile) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          border: border,
          borderRadius: borderRadius,
          image: DecorationImage(
            image: FileImage(File(imageUrl)),
            fit: fit ?? BoxFit.cover,
          ),
        ),
      );
    } else {
      return noImageView ??
          CustomCacheNetworkImageView(
            imageUrl: kImageUrl,
            height: height,
            width: width,
            shape: shape,
            fit: fit,
            border: border,
            noImageView: noImageView,
            maxWidthDiskCache: maxWidthDiskCache,
            maxHeightDiskCache: maxHeightDiskCache,
            errorIconSize: errorIconSize,
            errorIconPadding: errorIconPadding,
            borderRadius: borderRadius,
          );
    }
  }
}

class _CacheNetworkImageLoadingShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape? shape;

  const _CacheNetworkImageLoadingShimmer({
    this.height,
    this.width,
    this.border,
    this.borderRadius,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.blackColor.withValues(alpha: 0.4),
      highlightColor: AppColors.whiteColor.withValues(alpha: 0.6),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
          border: border,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}

class ImageErrorWidget extends StatelessWidget {
  final double? errorIconSize;
  final EdgeInsetsGeometry? errorIconPadding;

  const ImageErrorWidget({
    super.key,
    this.errorIconSize,
    this.errorIconPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: errorIconPadding ?? EdgeInsets.zero,
        child: SvgIconView(
          size: errorIconSize,
          icon: ImagesAsset.noImage,
          color: AppColors.textPrimaryColor,
        ),
      ),
    );
  }
}
