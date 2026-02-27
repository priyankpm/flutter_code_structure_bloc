import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String? nameError;
  final String? phoneError;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isSuccess;
  final String? failureMessage;

  const SignUpState({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.nameError,
    this.phoneError,
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.failureMessage,
  });

  bool get isValid =>
      name.isNotEmpty &&
      phone.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      nameError == null &&
      phoneError == null &&
      emailError == null &&
      passwordError == null;

  SignUpState copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? nameError,
    String? phoneError,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isSuccess,
    String? failureMessage,
  }) {
    return SignUpState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      nameError: nameError,
      phoneError: phoneError,
      emailError: emailError,
      passwordError: passwordError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    password,
    nameError,
    phoneError,
    emailError,
    passwordError,
    isLoading,
    isSuccess,
    failureMessage,
  ];
}
