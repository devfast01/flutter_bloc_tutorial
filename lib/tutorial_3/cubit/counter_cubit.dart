import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/tutorial_3/cubit/counter_state.dart';


class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasInremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasInremented: false));
}
