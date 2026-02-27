import 'package:flutter/cupertino.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';

const String kImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhGHdcalX0wUWxZQCiSv8WzmSPpFGHr4jlsw&s";

class AppConstant {
  static const String appName = "Project Structure Bloc";
  static const String sfProFont = "SF-Pro";

  static BuildContext globalCtx =
      rootNavigatorKey.currentState!.overlay!.context;

  static Duration kAnimationDuration200 = Duration(microseconds: 200);
  static Duration kAnimationDuration300 = Duration(microseconds: 300);
}
