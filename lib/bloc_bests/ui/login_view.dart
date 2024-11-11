import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/bloc_bests/bloc/login_bloc.dart';
import 'package:flutter_block_tutorials/bloc_bests/bloc/login_event.dart';
import 'package:flutter_block_tutorials/bloc_bests/bloc/login_state.dart';
import 'package:flutter_block_tutorials/bloc_bests/data/repository/login_repository.dart';

class LoginViewLast extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginRepository loginRepository;

  LoginViewLast({super.key, required this.loginRepository});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => LoginBlocLast(loginRepository: loginRepository),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0), // Add padding at the bottom
            child: Column(
              children: [
                _loginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBlocLast, LoginStateLast>(
      listener: (context, state) {},
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50), // Add spacing at the top
              _loginDetails(),
              _usernameField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginDetails() {
    return BlocBuilder<LoginBlocLast, LoginStateLast>(
      builder: (context, state) {
        if (state is LoginSuccessState) {
          return Container(
            margin: const EdgeInsets.only(top: 50, bottom: 50), // Adjust margins
            child: Column(
              children: [
                Text(
                  "Login success: ${state.loginModel.success}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Login message: ${state.loginModel.message}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Login livetime: ${state.loginModel.data!.livetime}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          margin: const EdgeInsets.only(top: 50, bottom: 50),
          child: const Column(
            children: [
              Text(
                "Login success: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Login message: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Login livetime: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBlocLast, LoginStateLast>(
      builder: (context, state) {
        return TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Username',
          ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBlocLast, LoginStateLast>(
      builder: (context, state) {
        return TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'Password',
          ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBlocLast, LoginStateLast>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ElevatedButton(
            onPressed: () {
              final username = _usernameController.text.trim();
              final password = _passwordController.text.trim();
              context.read<LoginBlocLast>().add(
                LoginRequested(username: username, password: password),
              );
            },
            child: const Text('Login'),
          ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
