import 'dart:ui';

abstract class ThemeRepository {
  // Get the currently installed theme saved in local storage
  Brightness getStoredTheme(String key);

  // Replace current theme value stored in local storage
  Future<void> setStoredTheme(Brightness brightness);
}