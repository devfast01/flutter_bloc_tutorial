import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/main.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

Future<void> main(List<String> args) async {
  final cubit = CounterCubit();

  final streamSubscription = cubit.stream.listen(
      greenLog); //* this subscribes to the cubit state stream and prints the state values emitted by it

  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.increment();

  await Future.delayed(Duration
      .zero); //* bu delay bolup gecyan prossesin isleysini gorkezmek ucin, ayryp barlap gor !

  await streamSubscription.cancel();
  await cubit.close();
}
