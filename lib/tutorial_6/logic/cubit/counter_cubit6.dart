import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/tutorial_6/constants/internet_enum.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/counter_state6.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/internet_cubit.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/internet_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) 
      : super(CounterState(counterValue: 0)) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasInremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasInremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
