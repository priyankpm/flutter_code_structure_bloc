import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_structure_bloc/presentation/utils/enum.dart';

class Utils {
  static void hideKeyboardInApp(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static void onHapticFeedbackImpact() {
    if (Platform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }

  static bool isVideo(String path) {
    final videoExtensions = [
      '.mp4',
      '.mov',
      '.wmv',
      '.avi',
      '.flv',
      '.mkv',
      '.webm',
    ];
    return videoExtensions.any((ext) => path.toLowerCase().endsWith(ext));
  }

  static ImagePathType getImageType(String? url) {
    if (isVideo(url ?? "")) {
      if ((url?.startsWith("https") ?? false) ||
          (url?.startsWith("http") ?? false)) {
        return ImagePathType.isNetworkVideo;
      } else {
        return ImagePathType.isFileVideo;
      }
    } else if ((url?.startsWith("https") ?? false) ||
        (url?.startsWith("http") ?? false)) {
      return ImagePathType.isNetwork;
    } else if ((url?.startsWith("assets") ?? false) &&
        (url?.endsWith("svg") ?? false)) {
      return ImagePathType.isSvg;
    } else if (url?.startsWith("assets") ?? false) {
      return ImagePathType.isAssets;
    } else if (File(url ?? '').existsSync()) {
      return ImagePathType.isFile;
    } else {
      return ImagePathType.none;
    }
  }
}
