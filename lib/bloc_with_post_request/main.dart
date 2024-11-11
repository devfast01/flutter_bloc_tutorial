import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/bloc_with_post_request/bloc/restaurant_bloc.dart';
import 'package:flutter_block_tutorials/bloc_with_post_request/ui/home_page.dart';
// own import

import 'data/repository/restaurant_repository.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api-Get',
      home: BlocProvider(
        create: (context) =>
            RestaurantBloc(restaurantRepository: RestaurantRepository()),
        child: HomePage(),
      ),
    );
  }
}
