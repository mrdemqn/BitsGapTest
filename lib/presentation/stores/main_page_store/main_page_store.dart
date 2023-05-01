import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../../domain/service/authentication_service.dart';

part 'main_page_store.g.dart';

class MainPageStore extends _MainPageStore with _$MainPageStore {
  MainPageStore(AuthenticationService service) : super(service);
}

abstract class _MainPageStore with Store {
  final AuthenticationService _service;

  _MainPageStore(this._service);

  @observable
  bool isLoadingScreen = false;

  final _loadingController = StreamController<bool>();
  Stream<bool> get loadingStream => _loadingController.stream;

  @action
  Future<void> logOut() async {
    try {
      isLoadingScreen = true;
      _loadingController.add(true);
      await Future.delayed(const Duration(seconds: 1));
      await _service.logOut();
    } finally {
      isLoadingScreen = false;
      _loadingController.add(false);
    }
  }
}