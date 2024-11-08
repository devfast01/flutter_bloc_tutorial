import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/internet_cubit.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/router/app_router.dart';
import 'logic/cubit/counter_cubit6.dart';

void main() {
  runApp(Tutorial_6(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

// ignore: camel_case_types
class Tutorial_6 extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const Tutorial_6({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
              internetCubit: BlocProvider.of<InternetCubit>(context)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
