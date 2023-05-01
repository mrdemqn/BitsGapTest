import 'dart:ui';

extension StringExt on String? {
  Brightness get brightness {
    if (Brightness.dark.name == this) {
      return Brightness.dark;
    }
    return Brightness.light;
  }
}
