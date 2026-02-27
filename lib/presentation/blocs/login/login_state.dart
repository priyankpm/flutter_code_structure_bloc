import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isSuccess;
  final String? failureMessage;

  const LoginState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.failureMessage,
  });

  bool get isValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailError == null &&
      passwordError == null;

  LoginState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isSuccess,
    String? failureMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        emailError,
        passwordError,
        isLoading,
        isSuccess,
        failureMessage,
      ];
}
