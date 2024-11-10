import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SettingsState extends Equatable {
  // Equatable libraryny ulanmak maslahat berilyar, dart syntaxsis ucin
  late bool appNotifications;
  final bool emailNotifications;

  SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    required bool appNotifications,
    required bool emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications,
      emailNotifications: emailNotifications,
    );
  }

  @override
  List<Object> get props => [
        emailNotifications,
        appNotifications,
      ];

  @override
  String toString() =>
      'SettingsState(appNotifications: $appNotifications, emailNotifications: $emailNotifications)';
}
