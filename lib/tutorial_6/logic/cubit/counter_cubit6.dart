import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/counter_state6.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() 
      : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasInremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasInremented: false));

}
