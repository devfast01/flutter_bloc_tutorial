import 'package:flutter/material.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/screens/home_screen.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/screens/second_screen.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/screens/settings_screen.dart';
import 'package:flutter_block_tutorials/tutorial_6/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
