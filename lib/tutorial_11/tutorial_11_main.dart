import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/internet_cubit11.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/settings_cubit11.dart';
import 'package:flutter_block_tutorials/tutorial_11/presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'logic/cubit/counter_cubit11.dart';
import 'package:path_provider/path_provider.dart';

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

void main() async {
  // const a = MyClass1(value: 1);
  // const b = MyClass1(value: 2);

  // debugPrint('a == b ${a == b}');

  // debugPrint('a == a ${a == a}');
  // debugPrint('b == b ${b == b}');
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(Tutorial_11(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

// ignore: camel_case_types
class Tutorial_11 extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const Tutorial_11({
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
        initialRoute: '/',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
