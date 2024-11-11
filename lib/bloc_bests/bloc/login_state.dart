import 'package:equatable/equatable.dart';
import 'package:flutter_block_tutorials/bloc_bests/data/model/login_response_model.dart';

abstract class LoginStateLast extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginStateLast {}

class LoginSuccessState extends LoginStateLast {
  final LoginResponseModel loginModel;

  LoginSuccessState({required this.loginModel});

  @override
  // TODO: implement props
  List<Object> get props => [loginModel];
}

class LoginFailState extends LoginStateLast {
  final String message;

  LoginFailState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
