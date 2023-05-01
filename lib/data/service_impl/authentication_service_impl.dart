import 'dart:convert';

import 'package:bitsgap/domain/models/user.dart';
import 'package:bitsgap/domain/repositories/preferences_repository.dart';
import 'package:bitsgap/domain/service/authentication_service.dart';

import '../../utils/const.dart';

class AuthenticationServiceImpl extends AuthenticationService {
  final PreferencesRepository _preferences;

  AuthenticationServiceImpl(this._preferences);

  User? _user;

  User? get user => _user;

  @override
  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    final userPrefs = _preferences.getString(userName);
    if (userPrefs != null) {
      final userJson = json.decode(userPrefs);
      final userModel = User.fromJson(userJson);
      if (userModel.password == password) {
        _user = userModel;
        return true;
      } else {
        throw ArgumentError(Const.wrongPasswordMessage);
      }
    }
    throw ArgumentError(Const.userNotFoundMessage);
  }

  @override
  Future<void> register(User user) async {
    final userPrefs = _preferences.getString(user.userName);
    if (userPrefs != null) {
      throw ArgumentError(Const.userAlreadyExistsMessage);
    }
    _preferences.setString(user.userName, jsonEncode(user.toJson()));
  }

  @override
  Future<void> logOut() async {
    _user = null;
  }
}
