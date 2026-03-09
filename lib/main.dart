import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure_bloc/core/di/injection.dart';
import 'package:project_structure_bloc/core/providers/app_providers.dart';
import 'package:project_structure_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/theme/theme_state.dart';
import 'package:project_structure_bloc/presentation/routes/app_routes.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';
import 'package:project_structure_bloc/presentation/utils/app_preference.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'presentation/utils/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initDependencies();

  await AppPreference.initMySharedPreferences();
  await AppColors.changeThemeColor(usedTheme: AppPreference.getUsedThemeName());

  runApp(MultiBlocProvider(providers: AppProviders.providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              key: ValueKey(state.themeName),
              debugShowCheckedModeBanner: false,
              title: AppConstant.appName,
              theme: ThemeData(hoverColor: Colors.transparent),
              routerConfig: AppRoutes.router,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(1.0)),
                  child: child ?? SizedBox(),
                );
              },
            );
          },
        );
      },
    );
  }
}
