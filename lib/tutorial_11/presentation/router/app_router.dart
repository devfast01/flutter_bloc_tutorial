import 'package:flutter/material.dart';
import 'package:flutter_block_tutorials/tutorial_11/presentation/screens/home_screen.dart';
import 'package:flutter_block_tutorials/tutorial_11/presentation/screens/second_screen.dart';
import 'package:flutter_block_tutorials/tutorial_11/presentation/screens/settings_screen.dart';
import 'package:flutter_block_tutorials/tutorial_11/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen11(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen11(
            title: "Second Screen",
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen11(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen11(),
        );
      default:
        return null;
    }
  }
}
