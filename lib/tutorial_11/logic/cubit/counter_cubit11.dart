import 'package:flutter/widgets.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/counter_state11.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  // * fromJson. programma islap baslanda elementelerin onki state-lerini almak ucin ulanylyar
  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  // * toJson funcksiya hacanda elementlerin state-leri storege-a yazylanda ulanylyar
  @override
  Map<String, dynamic> toJson(CounterState state) {
    // addError(Exception("Couldn't write to storage!"), StackTrace.current);
    return state.toMap();
  }

  @override
  void onChange(Change<CounterState> change) {
    // debugPrint('state changed ${change.currentState.counterValue}');
    super.onChange(change);
  }
}
