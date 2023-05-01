// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationStore on _AuthenticationStore, Store {
  late final _$isLoadingScreenAtom =
      Atom(name: '_AuthenticationStore.isLoadingScreen', context: context);

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

  late final _$errorLoginMessageAtom =
      Atom(name: '_AuthenticationStore.errorLoginMessage', context: context);

  @override
  String? get errorLoginMessage {
    _$errorLoginMessageAtom.reportRead();
    return super.errorLoginMessage;
  }

  @override
  set errorLoginMessage(String? value) {
    _$errorLoginMessageAtom.reportWrite(value, super.errorLoginMessage, () {
      super.errorLoginMessage = value;
    });
  }

  late final _$errorRegisterMessageAtom =
      Atom(name: '_AuthenticationStore.errorRegisterMessage', context: context);

  @override
  String? get errorRegisterMessage {
    _$errorRegisterMessageAtom.reportRead();
    return super.errorRegisterMessage;
  }

  @override
  set errorRegisterMessage(String? value) {
    _$errorRegisterMessageAtom.reportWrite(value, super.errorRegisterMessage,
        () {
      super.errorRegisterMessage = value;
    });
  }

  late final _$emptyErrorMessagesAtom =
      Atom(name: '_AuthenticationStore.emptyErrorMessages', context: context);

  @override
  ObservableMap<String, String> get emptyErrorMessages {
    _$emptyErrorMessagesAtom.reportRead();
    return super.emptyErrorMessages;
  }

  @override
  set emptyErrorMessages(ObservableMap<String, String> value) {
    _$emptyErrorMessagesAtom.reportWrite(value, super.emptyErrorMessages, () {
      super.emptyErrorMessages = value;
    });
  }

  late final _$currentAlignBackgroundButtonAtom = Atom(
      name: '_AuthenticationStore.currentAlignBackgroundButton',
      context: context);

  @override
  Alignment get currentAlignBackgroundButton {
    _$currentAlignBackgroundButtonAtom.reportRead();
    return super.currentAlignBackgroundButton;
  }

  @override
  set currentAlignBackgroundButton(Alignment value) {
    _$currentAlignBackgroundButtonAtom
        .reportWrite(value, super.currentAlignBackgroundButton, () {
      super.currentAlignBackgroundButton = value;
    });
  }

  late final _$userNameLoginControllerAtom = Atom(
      name: '_AuthenticationStore.userNameLoginController', context: context);

  @override
  TextEditingController get userNameLoginController {
    _$userNameLoginControllerAtom.reportRead();
    return super.userNameLoginController;
  }

  @override
  set userNameLoginController(TextEditingController value) {
    _$userNameLoginControllerAtom
        .reportWrite(value, super.userNameLoginController, () {
      super.userNameLoginController = value;
    });
  }

  late final _$passwordLoginControllerAtom = Atom(
      name: '_AuthenticationStore.passwordLoginController', context: context);

  @override
  TextEditingController get passwordLoginController {
    _$passwordLoginControllerAtom.reportRead();
    return super.passwordLoginController;
  }

  @override
  set passwordLoginController(TextEditingController value) {
    _$passwordLoginControllerAtom
        .reportWrite(value, super.passwordLoginController, () {
      super.passwordLoginController = value;
    });
  }

  late final _$emailRegisterControllerAtom = Atom(
      name: '_AuthenticationStore.emailRegisterController', context: context);

  @override
  TextEditingController get emailRegisterController {
    _$emailRegisterControllerAtom.reportRead();
    return super.emailRegisterController;
  }

  @override
  set emailRegisterController(TextEditingController value) {
    _$emailRegisterControllerAtom
        .reportWrite(value, super.emailRegisterController, () {
      super.emailRegisterController = value;
    });
  }

  late final _$userNameRegisterControllerAtom = Atom(
      name: '_AuthenticationStore.userNameRegisterController',
      context: context);

  @override
  TextEditingController get userNameRegisterController {
    _$userNameRegisterControllerAtom.reportRead();
    return super.userNameRegisterController;
  }

  @override
  set userNameRegisterController(TextEditingController value) {
    _$userNameRegisterControllerAtom
        .reportWrite(value, super.userNameRegisterController, () {
      super.userNameRegisterController = value;
    });
  }

  late final _$passwordRegisterControllerAtom = Atom(
      name: '_AuthenticationStore.passwordRegisterController',
      context: context);

  @override
  TextEditingController get passwordRegisterController {
    _$passwordRegisterControllerAtom.reportRead();
    return super.passwordRegisterController;
  }

  @override
  set passwordRegisterController(TextEditingController value) {
    _$passwordRegisterControllerAtom
        .reportWrite(value, super.passwordRegisterController, () {
      super.passwordRegisterController = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthenticationStore.login', context: context);

  @override
  Future<void> login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthenticationStore.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_AuthenticationStoreActionController =
      ActionController(name: '_AuthenticationStore', context: context);

  @override
  void onLoginUserNameChange(String email) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.onLoginUserNameChange');
    try {
      return super.onLoginUserNameChange(email);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLoginPasswordChange(String email) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.onLoginPasswordChange');
    try {
      return super.onLoginPasswordChange(email);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRegisterEmailChange(String email) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.onRegisterEmailChange');
    try {
      return super.onRegisterEmailChange(email);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRegisterUserNameChange(String email) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.onRegisterUserNameChange');
    try {
      return super.onRegisterUserNameChange(email);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRegisterPasswordChange(String email) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.onRegisterPasswordChange');
    try {
      return super.onRegisterPasswordChange(email);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingScreen: ${isLoadingScreen},
errorLoginMessage: ${errorLoginMessage},
errorRegisterMessage: ${errorRegisterMessage},
emptyErrorMessages: ${emptyErrorMessages},
currentAlignBackgroundButton: ${currentAlignBackgroundButton},
userNameLoginController: ${userNameLoginController},
passwordLoginController: ${passwordLoginController},
emailRegisterController: ${emailRegisterController},
userNameRegisterController: ${userNameRegisterController},
passwordRegisterController: ${passwordRegisterController}
    ''';
  }
}
