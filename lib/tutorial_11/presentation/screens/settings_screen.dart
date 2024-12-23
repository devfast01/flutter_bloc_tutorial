import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/settings_cubit11.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/settings_state11.dart';

class SettingsScreen11 extends StatelessWidget {
  const SettingsScreen11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: const Text('Settings'),
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(
              'App ${state.appNotifications.toString().toUpperCase()}, Email ${state.emailNotifications.toString().toUpperCase()}',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('notificationSnackBar $notificationSnackBar'),
              duration: const Duration(
                  milliseconds:
                      300), // Use milliseconds instead of microseconds for better visibility
            ),
          );
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SwitchListTile(
                    value: state.appNotifications,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleAppNotifications(newValue);
                    },
                    title: const Text('App Notifications'),
                  ),
                  SwitchListTile(
                    value: state.emailNotifications,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleEmailNotifications(newValue);
                    },
                    title: const Text('Email Notifications'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
