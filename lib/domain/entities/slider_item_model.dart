import 'package:equatable/equatable.dart';

class SliderItemModel extends Equatable {
  final String title;
  final String subTitle;

  const SliderItemModel(this.title, this.subTitle);

  @override
  List<Object?> get props => [title, subTitle];
}
