import 'package:flutter/material.dart';

abstract class ThemeService {
  ThemeData get lightTheme;

  ThemeData get darkTheme;

  ThemeData getTheme();

  Future<ThemeData> changeTheme();
}