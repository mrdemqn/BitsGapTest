import 'package:bitsgap/domain/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore extends _ThemeStore with _$ThemeStore {
  ThemeStore(ThemeService themeService) : super(themeService);
}

abstract class _ThemeStore with Store {
  final ThemeService _themeService;

  _ThemeStore(this._themeService) {
    currentTheme = _themeService.darkTheme;
    currentMode = ThemeMode.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  ThemeData get light => _themeService.lightTheme;

  ThemeData get dark => _themeService.darkTheme;

  @observable
  ThemeData? currentTheme;

  @observable
  ThemeMode? currentMode;

  @action
  ThemeData getTheme() {
    currentTheme = _themeService.getTheme();
    currentMode = currentTheme?.brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    return currentTheme!;
  }

  @action
  Future<void> changeTheme() async {
    currentTheme = await _themeService.changeTheme();
    currentMode = currentTheme?.brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    final style = currentMode == ThemeMode.light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
