import 'package:get_it/get_it.dart';
import 'package:project_structure_bloc/core/storage/splash_redirection_storage.dart';
import 'package:project_structure_bloc/domain/useCases/onboarding_use_case.dart';
import 'package:project_structure_bloc/presentation/blocs/onBoarding/onboarding_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_bloc.dart';
import 'package:project_structure_bloc/presentation/utils/app_preference.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// Storage
  sl.registerLazySingleton(() => AppPreference());
  sl.registerLazySingleton(() => SplashRedirectionStorage());

  /// UseCase
  sl.registerLazySingleton(() => OnboardingUseCase());

  /// Bloc
  sl.registerLazySingleton(() => OnboardingBloc(sl(),sl()));
  sl.registerLazySingleton(() => SplashBloc(sl()));
}
