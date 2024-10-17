import 'dart:convert';

import 'package:identicon_generator/ui/screens/common/blocs/icon/icon_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IconSettingsDataSource {
  const IconSettingsDataSource({required this.prefs});

  final SharedPreferencesWithCache prefs;

  void saveIconSettings(IconState value) =>
      prefs.setString(iconSettingKey, jsonEncode(value));

  IconState getIconSettings() {
    final jsonString = prefs.getString(iconSettingKey);

    if (jsonString == null) {
      return const IconState();
    } else {
      return IconState.fromJson(jsonDecode(jsonString));
    }
  }

  static const iconSettingKey = 'icon setting';
}
