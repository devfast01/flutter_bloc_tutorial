import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/settings_state11.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
          SettingsState(
            appNotifications: false,
            emailNotifications: false,
          ),
        );

  void toggleAppNotifications(bool newValue) {
    // * sular yaly gornusde state uytgedilyan daldir, uytgedip barlap goraymeli
    // state.appNotifications = newValue;
    // emit(state);

    // * askyny koment edip yokarkyny acyp barlap bolyar
    emit(state.copyWith(
        appNotifications: newValue,
        emailNotifications: state.emailNotifications));
  }

  void toggleEmailNotifications(bool newValue) => emit(state.copyWith(
      emailNotifications: newValue, appNotifications: state.appNotifications));
}
