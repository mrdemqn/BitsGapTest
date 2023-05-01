import 'package:flutter/material.dart';

abstract class ThemeService {
  ThemeData get lightTheme;

  ThemeData get darkTheme;

  // Get currently installed theme
  ThemeData getTheme();

  // Change currently installed theme
  Future<ThemeData> changeTheme();
}