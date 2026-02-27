import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends LoginEvent {}

class PasswordChangedEvent extends LoginEvent {}

class LoginSubmitEvent extends LoginEvent {}
