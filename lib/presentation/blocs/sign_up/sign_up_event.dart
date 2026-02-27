import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpNameChangedEvent extends SignUpEvent {
  final String name;
  SignUpNameChangedEvent(this.name);
  @override
  List<Object?> get props => [name];
}

class SignUpPhoneChangedEvent extends SignUpEvent {
  final String phone;
  SignUpPhoneChangedEvent(this.phone);
  @override
  List<Object?> get props => [phone];
}

class SignUpEmailChangedEvent extends SignUpEvent {
  final String email;
  SignUpEmailChangedEvent(this.email);
  @override
  List<Object?> get props => [email];
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  final String password;
  SignUpPasswordChangedEvent(this.password);
  @override
  List<Object?> get props => [password];
}

class SignUpSubmitEvent extends SignUpEvent {}
