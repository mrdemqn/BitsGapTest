// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageStore on _MainPageStore, Store {
  late final _$isLoadingScreenAtom =
      Atom(name: '_MainPageStore.isLoadingScreen', context: context);

  @override
  bool get isLoadingScreen {
    _$isLoadingScreenAtom.reportRead();
    return super.isLoadingScreen;
  }

  @override
  set isLoadingScreen(bool value) {
    _$isLoadingScreenAtom.reportWrite(value, super.isLoadingScreen, () {
      super.isLoadingScreen = value;
    });
  }

  late final _$logOutAsyncAction =
      AsyncAction('_MainPageStore.logOut', context: context);

  @override
  Future<void> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
isLoadingScreen: ${isLoadingScreen}
    ''';
  }
}
