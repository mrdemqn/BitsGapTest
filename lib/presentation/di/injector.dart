import 'package:bitsgap/data/repositories_impl/preferences_repository_impl.dart';
import 'package:bitsgap/data/service_impl/theme_service_impl.dart';
import 'package:bitsgap/domain/repositories/preferences_repository.dart';
import 'package:bitsgap/domain/repositories/theme_repository.dart';
import 'package:bitsgap/domain/service/authentication_service.dart';
import 'package:bitsgap/domain/service/theme_service.dart';
import 'package:bitsgap/presentation/stores/authentication_store/authentication_store.dart';
import 'package:bitsgap/presentation/stores/theme_store/theme_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories_impl/theme_repository_impl.dart';
import '../../data/service_impl/authentication_service_impl.dart';
import '../stores/main_page_store/main_page_store.dart';

Future<void> initAppInjections() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  GetIt.I.registerFactory<PreferencesRepository>(
    () => PreferencesRepositoryImpl(
      preferences,
    ),
  );

  GetIt.I.registerFactory<ThemeRepository>(
    () => ThemeRepositoryImpl(
      GetIt.I.get<PreferencesRepository>(),
    ),
  );

  GetIt.I.registerSingleton<ThemeService>(
    ThemeServiceImpl(
      GetIt.I.get<ThemeRepository>(),
    ),
  );

  GetIt.I.registerSingleton<AuthenticationService>(
    AuthenticationServiceImpl(
      GetIt.I.get<PreferencesRepository>(),
    ),
  );

  GetIt.I.registerSingleton<ThemeStore>(
    ThemeStore(
      GetIt.I.get<ThemeService>(),
    ),
  );

  GetIt.I.registerSingleton<AuthenticationStore>(
    AuthenticationStore(
      GetIt.I.get<AuthenticationService>(),
    ),
  );

  GetIt.I.registerFactory<MainPageStore>(
    () => MainPageStore(
      GetIt.I.get<AuthenticationService>(),
    ),
  );
}
