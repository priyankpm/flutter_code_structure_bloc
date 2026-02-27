import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/core/storage/splash_redirection_storage.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_event.dart';
import 'package:project_structure_bloc/presentation/blocs/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashRedirectionStorage splashRedirectionStorage;

  SplashBloc(this.splashRedirectionStorage) : super(SplashInitial()) {
    on<SplashStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    bool isOnboardingCompleted =
        splashRedirectionStorage.getOnBoarding() ?? false;
    if (isOnboardingCompleted) {
      // emit(SplashNavigateToHome());
      emit(SplashNavigateToLogin());
    } else {
      emit(SplashNavigateToOnboarding());
    }
  }
}
