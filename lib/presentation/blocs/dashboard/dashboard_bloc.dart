import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_event.dart';
import 'package:project_structure_bloc/presentation/blocs/dashboard/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()){
    on<DashboardTabChanged>((event, emit) {
      emit(DashboardTabState(event.index));
    },);
  }
}
