import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:project_structure_bloc/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:project_structure_bloc/presentation/utils/validation_utils.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpNameChangedEvent>((event, emit) {
      final nameError = Validator.validateName(event.name);
      emit(state.copyWith(name: event.name, nameError: nameError));
    });

    on<SignUpPhoneChangedEvent>((event, emit) {
      final phoneError = Validator.validatePhone(
        event.phone.number,
        minLength: event.phone.minLength,
        maxLength: event.phone.maxLength,
      );
      emit(state.copyWith(
        phone: event.phone.number,
        countryCode: event.phone.countryCode,
        countryISOCode: event.phone.countryISOCode,
        phoneError: phoneError,
      ));
    });

    on<SignUpEmailChangedEvent>((event, emit) {
      final emailError = Validator.validateEmail(event.email);
      emit(state.copyWith(email: event.email, emailError: emailError));
    });

    on<SignUpPasswordChangedEvent>((event, emit) {
      final passwordError = Validator.passwordValidator(value: event.password);
      emit(state.copyWith(
          password: event.password, passwordError: passwordError));
    });

    on<SignUpSubmitEvent>((event, emit) {
      // Handle actual sign up logic if needed
      emit(state.copyWith(isSuccess: true));
    });
  }
}
