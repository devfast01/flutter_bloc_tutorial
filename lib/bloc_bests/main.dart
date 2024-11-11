import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/bloc_bests/bloc/login_bloc.dart';
import 'package:flutter_block_tutorials/bloc_bests/data/repository/login_repository.dart';

import 'ui/login_view.dart';
// own import

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRepository = LoginRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlocLast>(
          create: (context) => LoginBlocLast(loginRepository: loginRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Api-Get',
        home: LoginViewLast(loginRepository: loginRepository),
      ),
    );
  }
}

