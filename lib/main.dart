import 'package:bitsgap/domain/service/authentication_service.dart';
import 'package:bitsgap/presentation/pages/main_page.dart';
import 'package:bitsgap/presentation/stores/theme_store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'presentation/di/injector.dart';
import 'presentation/pages/authentication_page.dart';

void main() async {
  await initAppInjections();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _themeStore = GetIt.I.get<ThemeStore>();
  final _authService = GetIt.I.get<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          theme: _themeStore.light,
          darkTheme: _themeStore.dark,
          themeMode: _themeStore.currentMode,
          home: _authService.getCurrentLoggedInUser() != null
              ? const MainPage()
              : const AuthenticationPage(),
        );
      },
    );
  }
}
