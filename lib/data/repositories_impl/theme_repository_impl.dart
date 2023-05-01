import 'dart:ui';

import 'package:bitsgap/domain/repositories/theme_repository.dart';
import 'package:bitsgap/utils/const.dart';
import 'package:bitsgap/utils/extensions/string_extension.dart';

import '../../domain/repositories/preferences_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final PreferencesRepository _preferences;

  ThemeRepositoryImpl(this._preferences);

  @override
  Brightness getStoredTheme(String key) => _preferences.getString(key).brightness;

  @override
  Future<void> setStoredTheme(Brightness brightness) => _preferences.setString(Const.themeKey, brightness.name);
}
