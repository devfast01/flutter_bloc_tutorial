import 'package:equatable/equatable.dart';

abstract class LoginEventLast extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEventLast {
  final String username;
  final String password;

  LoginRequested({required this.username, required this.password});
}

class FetchLoginEventLast extends LoginEventLast {}
