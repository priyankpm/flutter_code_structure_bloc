import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpFailState extends SignUpState {
  final String message;

  SignUpFailState(this.message);

  @override
  List<Object?> get props => [message];
}
