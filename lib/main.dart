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

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          theme: _themeStore.light,
          darkTheme: _themeStore.dark,
          themeMode: _themeStore.currentMode,
          home: const AuthenticationPage(),
        );
      },
    );
  }
}
