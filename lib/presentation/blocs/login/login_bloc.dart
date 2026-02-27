import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_event.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_state.dart';
import 'package:project_structure_bloc/presentation/utils/validation_utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>((event, emit) {
      final emailError = Validator.validateEmail(event.email);
      emit(state.copyWith(email: event.email, emailError: emailError));
    });

    on<PasswordChangedEvent>((event, emit) {
      final passwordError = Validator.passwordValidator(value: event.password,);
      emit(state.copyWith(
          password: event.password, passwordError: passwordError));
    });

    on<LoginSubmitEvent>((event, emit) {
      // Handle login logic
      emit(state.copyWith(isSuccess: true));
    });
  }
}
