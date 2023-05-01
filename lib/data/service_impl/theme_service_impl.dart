import 'package:bitsgap/domain/repositories/theme_repository.dart';
import 'package:bitsgap/domain/service/theme_service.dart';
import 'package:bitsgap/utils/app_colors.dart';
import 'package:bitsgap/utils/app_fonts.dart';
import 'package:bitsgap/utils/const.dart';
import 'package:flutter/material.dart';

class ThemeServiceImpl implements ThemeService {
  final ThemeRepository _themeRepository;

  ThemeServiceImpl(this._themeRepository);

  @override
  ThemeData get lightTheme => ThemeData(
        fontFamily: AppFonts.ttNormsPro,
        colorScheme: const ColorScheme.light(
          background: AppColors.backgroundLight,
          surface: AppColors.foregroundLight,
          primary: AppColors.primaryLight,
          secondary: AppColors.secondaryLight,
          error: AppColors.error,
          onTertiary: AppColors.success,
          outline: AppColors.largeButtonLight,
        ),
      );

  @override
  ThemeData get darkTheme => ThemeData(
        fontFamily: AppFonts.ttNormsPro,
        colorScheme: const ColorScheme.dark(
          background: AppColors.backgroundDark,
          surface: AppColors.foregroundDark,
          primary: AppColors.primaryDark,
          secondary: AppColors.secondaryDark,
          error: AppColors.error,
          onTertiary: AppColors.success,
          outline: AppColors.largeButtonDark,
        ),
      );

  @override
  ThemeData getTheme() {
    final brightness = _themeRepository.getStoredTheme(Const.themeKey);
    if (brightness == Brightness.dark) {
      return darkTheme;
    }
    return lightTheme;
  }

  @override
  Future<ThemeData> changeTheme() async {
    final brightness = _getBrightnessForChange();
    await _themeRepository.setStoredTheme(brightness);
    return getTheme();
  }

  Brightness _getBrightnessForChange() {
    final brightness = _themeRepository.getStoredTheme(Const.themeKey);
    if (brightness == Brightness.dark) {
      return Brightness.light;
    }
    return Brightness.dark;
  }
}
