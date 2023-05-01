// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  late final _$currentThemeAtom =
      Atom(name: '_ThemeStore.currentTheme', context: context);

  @override
  ThemeData? get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData? value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$currentModeAtom =
      Atom(name: '_ThemeStore.currentMode', context: context);

  @override
  ThemeMode? get currentMode {
    _$currentModeAtom.reportRead();
    return super.currentMode;
  }

  @override
  set currentMode(ThemeMode? value) {
    _$currentModeAtom.reportWrite(value, super.currentMode, () {
      super.currentMode = value;
    });
  }

  late final _$changeThemeAsyncAction =
      AsyncAction('_ThemeStore.changeTheme', context: context);

  @override
  Future<void> changeTheme() {
    return _$changeThemeAsyncAction.run(() => super.changeTheme());
  }

  late final _$_ThemeStoreActionController =
      ActionController(name: '_ThemeStore', context: context);

  @override
  ThemeData getTheme() {
    final _$actionInfo =
        _$_ThemeStoreActionController.startAction(name: '_ThemeStore.getTheme');
    try {
      return super.getTheme();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme},
currentMode: ${currentMode}
    ''';
  }
}
