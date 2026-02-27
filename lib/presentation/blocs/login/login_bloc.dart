import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_event.dart';
import 'package:project_structure_bloc/presentation/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginSubmitEvent>((event, emit) {});
  }
}
