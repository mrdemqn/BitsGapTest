import 'dart:ui';

abstract class ThemeRepository {
  Brightness getStoredTheme(String key);

  Future<void> setStoredTheme(Brightness brightness);
}