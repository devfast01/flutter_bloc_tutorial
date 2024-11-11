import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/auth_with_bloc/auth/auth_credentials.dart';
import 'package:flutter_block_tutorials/auth_with_bloc/session_cubit.dart';

enum AuthState { login, signUp, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  AuthCredentials credentials;

  AuthCubit({required this.sessionCubit, required this.credentials})
      : super(AuthState.login);

  void showLogin() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);
  void showConfirmSignUp({
    String? username,
    String? email,
    String? password,
  }) {
    credentials = AuthCredentials(
      username: username!,
      email: email,
      password: password,
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredentials credentials) =>
      sessionCubit.showSession(credentials);
}
