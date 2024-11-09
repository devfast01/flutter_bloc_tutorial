import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  // Equatable libraryny ulanmak maslahat berilyar, dart syntaxsis ucin
  int counterValue;
  bool wasInremented;
  CounterState({required this.counterValue, this.wasInremented = false});
  @override
  List<Object> get props => [counterValue, wasInremented];
}
