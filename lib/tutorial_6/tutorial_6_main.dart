import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/internet_cubit.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/settings_cubit.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/router/app_router.dart';
import 'logic/cubit/counter_cubit6.dart';

// ? bu yerde Equatable librarynyn ulanylysy bar
// ? Equatable libraryny ayryp barlar gor sonda tapawudy cykyar
class MyClass extends Equatable {
  final int value;

  const MyClass({
    required this.value,
  });

  @override
  List<Object> get props => [];
}

class MyClass1 {
  final int value;

  const MyClass1({
    required this.value,
  });
}

void main() {
  const a = MyClass1(value: 1);
  const b = MyClass1(value: 2);

  debugPrint('a == b ${a == b}');

  debugPrint('a == a ${a == a}');
  debugPrint('b == b ${b == b}');

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
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
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
