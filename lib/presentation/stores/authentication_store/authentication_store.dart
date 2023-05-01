import 'dart:async';

import 'package:bitsgap/domain/service/authentication_service.dart';
import 'package:bitsgap/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/models/user.dart';
import '../../../utils/regexp_expressions.dart';
import '../../pages/main_page.dart';

part 'authentication_store.g.dart';

class AuthenticationStore extends _AuthenticationStore with _$AuthenticationStore {
  AuthenticationStore(AuthenticationService service) : super(service);
}

abstract class _AuthenticationStore with Store {
  final AuthenticationService _service;

  _AuthenticationStore(this._service);

  @observable
  bool isLoadingScreen = false;

  @observable
  String? errorLoginMessage;

  @observable
  String? errorRegisterMessage;

  @observable
  ObservableMap<String, String> emptyErrorMessages = ObservableMap.of({});

  @observable
  Alignment currentAlignBackgroundButton = Alignment.centerLeft;

  bool get _isBackgroundButtonLeft => currentAlignBackgroundButton == Alignment.centerLeft;

  PageController pageController = PageController();

  int _currentPageIndex = 0;

  // Controller for showing loader when we have delay
  final _loadingController = StreamController<bool>();

  // Controller for showing success notification
  final _successNotifyController = StreamController<bool>();

  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<bool> get successNotifyStream => _successNotifyController.stream;

  @observable
  TextEditingController userNameLoginController = TextEditingController();

  @observable
  TextEditingController passwordLoginController = TextEditingController();

  @observable
  TextEditingController emailRegisterController = TextEditingController();

  @observable
  TextEditingController userNameRegisterController = TextEditingController();

  @observable
  TextEditingController passwordRegisterController = TextEditingController();

  // function to log user into his account
  @action
  Future<void> login(BuildContext context) async {
    if (!_isBackgroundButtonLeft) {
      currentAlignBackgroundButton = Alignment.centerLeft;
      pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      return;
    } else if (pageController.offset >= pageController.position.minScrollExtent) {
      pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
    try {
      if (_validateLoginFields()) return;
      isLoadingScreen = true;
      _loadingController.add(true);
      await Future.delayed(const Duration(seconds: 1));
      await _service.login(
        userName: userNameLoginController.text,
        password: passwordLoginController.text,
      );
      userNameLoginController.clear();
      passwordLoginController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => MainPage(),
        ),
      );
    } on ArgumentError catch (e) {
      errorLoginMessage = e.message;
    } finally {
      isLoadingScreen = false;
      _loadingController.add(false);
    }
  }

  // function for user registration
  @action
  Future<void> register() async {
    if (_isBackgroundButtonLeft) {
      currentAlignBackgroundButton = Alignment.centerRight;
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      return;
    } else if (pageController.offset <= pageController.position.maxScrollExtent) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
    try {
      if (_validateRegisterFields()) return;
      isLoadingScreen = true;
      _loadingController.add(true);
      await Future.delayed(const Duration(seconds: 1));
      await _service.register(
        User(
          email: emailRegisterController.text,
          userName: userNameRegisterController.text,
          password: passwordRegisterController.text,
        ),
      );
      emailRegisterController.clear();
      userNameRegisterController.clear();
      passwordRegisterController.clear();
    } on ArgumentError catch (e) {
      errorRegisterMessage = e.message;
    } finally {
      isLoadingScreen = false;
      _loadingController.add(false);
    }
  }

  @action
  void onLoginUserNameChange(String email) {
    _clearLoginFieldsError();
    userNameLoginController.value = userNameLoginController.value.copyWith(
      text: email.replaceAll(' ', '').trim(),
    );
  }

  @action
  void onLoginPasswordChange(String email) {
    _clearLoginFieldsError();
    passwordLoginController.value = passwordLoginController.value.copyWith(
      text: email.replaceAll(' ', '').trim(),
    );
  }

  @action
  void onRegisterEmailChange(String email) {
    _clearRegisterFieldsError();
    emailRegisterController.value = emailRegisterController.value.copyWith(
      text: email.replaceAll(' ', '').trim(),
    );
  }

  @action
  void onRegisterUserNameChange(String email) {
    _clearRegisterFieldsError();
    userNameRegisterController.value = userNameRegisterController.value.copyWith(
      text: email.replaceAll(' ', '').trim(),
    );
  }

  @action
  void onRegisterPasswordChange(String email) {
    _clearRegisterFieldsError();
    passwordRegisterController.value = passwordRegisterController.value.copyWith(
      text: email.replaceAll(' ', '').trim(),
    );
  }

  void onPageChange(int index) {
    if (_currentPageIndex != index && index == 0) {
      currentAlignBackgroundButton = Alignment.centerLeft;
    } else if (_currentPageIndex != index && index == 1) {
      currentAlignBackgroundButton = Alignment.centerRight;
    }
    _currentPageIndex = index;
  }

  // Clears register field errors when the user types characters
  void _clearLoginFieldsError() {
    errorLoginMessage = null;
    emptyErrorMessages.removeWhere(
      (key, value) => key == Const.loginUserNameKey || key == Const.loginPasswordKey,
    );
  }

  // Clears login field errors when the user types characters
  void _clearRegisterFieldsError() {
    errorRegisterMessage = null;
    emptyErrorMessages.removeWhere(
      (key, value) => key == Const.registerEmailKey || key == Const.registerUserNameKey || key == Const.registerPasswordKey,
    );
  }

  // Field validation function on the login page
  bool _validateLoginFields() {
    bool somethingWentWrong = false;
    if (userNameLoginController.text.isEmpty) {
      emptyErrorMessages.putIfAbsent(Const.loginUserNameKey, () => 'Please enter username');
      somethingWentWrong = true;
    }
    if (passwordLoginController.text.isEmpty) {
      emptyErrorMessages.putIfAbsent(Const.loginPasswordKey, () => 'Please enter password');
      somethingWentWrong = true;
    }
    return somethingWentWrong;
  }

  // Field validation function on the register page
  bool _validateRegisterFields() {
    bool somethingWentWrong = false;
    if (emailRegisterController.text.isEmpty) {
      emptyErrorMessages.putIfAbsent(Const.registerEmailKey, () => 'Please enter email');
      somethingWentWrong = true;
    }
    if (userNameRegisterController.text.isEmpty) {
      emptyErrorMessages.putIfAbsent(Const.registerUserNameKey, () => 'Please enter username');
      somethingWentWrong = true;
    }
    if (passwordRegisterController.text.isEmpty) {
      emptyErrorMessages.putIfAbsent(Const.registerPasswordKey, () => 'Please enter password');
      somethingWentWrong = true;
    }
    if (!RegexpExpressions.emailRegExp.hasMatch(emailRegisterController.text)) {
      emptyErrorMessages.putIfAbsent(Const.registerEmailKey, () => 'Please enter correct email');
      somethingWentWrong = true;
    }
    return somethingWentWrong;
  }
}
