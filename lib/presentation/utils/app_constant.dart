import 'package:flutter/cupertino.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';

class AppConstant {
  static const String appName = "Project Structure Bloc";

  static BuildContext globalCtx =
      rootNavigatorKey.currentState!.overlay!.context;

  static Duration kAnimationDuration200 = Duration(microseconds: 200);
  static Duration kAnimationDuration300 = Duration(microseconds: 300);
}
