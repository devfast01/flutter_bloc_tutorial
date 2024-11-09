import 'package:flutter_block_tutorials/tutorial_11/constants/internet_enum.dart';

abstract class InternetState {
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
