import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/router/app_router.dart';
import 'logic/cubit/counter_cubit6.dart';

void main() {
  runApp(Turorial_6());
}

// ignore: camel_case_types
class Turorial_6 extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  Turorial_6({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
