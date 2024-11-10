import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_block_tutorials/tutorial_11/constants/internet_enum.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/internet_state11.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  InternetCubit({
    required this.connectivity,
  }) : super(InternetLoading());

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
