import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEmailChangeEvent extends SignUpEvent {}

class SignUpEmailPasswordEvent extends SignUpEvent {}

class SignUpSubmitEvent extends SignUpEvent {}
