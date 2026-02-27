import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailState extends LoginState {
  final String message;

  LoginFailState(this.message);

  @override
  List<Object?> get props => [message];
}
