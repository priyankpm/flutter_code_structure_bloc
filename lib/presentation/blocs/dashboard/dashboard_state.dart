import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  final int selectedIndex;

  const DashboardState(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class DashboardInitialState extends DashboardState {
  const DashboardInitialState() : super(0);
}

class DashboardTabState extends DashboardState {
  const DashboardTabState(super.selectedIndex);
}
