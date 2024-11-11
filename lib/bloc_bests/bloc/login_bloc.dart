import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/bloc_bests/data/model/login_response_model.dart';
import 'package:flutter_block_tutorials/bloc_bests/data/repository/login_repository.dart';
import 'package:flutter_block_tutorials/main.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBlocLast extends Bloc<LoginEventLast, LoginStateLast> {
  final LoginRepository loginRepository;

  LoginBlocLast({required this.loginRepository}) : super(LoginLoadingState());

  @override
  Stream<LoginStateLast> mapEventToState(LoginEventLast event) async* {
    if (event is LoginRequested) {
      yield LoginLoadingState();
      try {
        LoginResponseModel loginModel =
            await loginRepository.login(event.username, event.password);
        greenLog("Bloc Success");
        yield LoginSuccessState(loginModel: loginModel);
      } catch (e) {
        greenLog("Bloc Error: $e");
        yield LoginFailState(message: "Login failed");
      }
    }
  }
}
