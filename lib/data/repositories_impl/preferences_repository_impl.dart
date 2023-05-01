import 'package:bitsgap/domain/repositories/preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences _preferences;
  PreferencesRepositoryImpl(this._preferences);

  @override
  String? getString(String key) => _preferences.getString(key);

  @override
  Future<bool> setString(String key, String data) => _preferences.setString(key, data);
  
  @override
  void remove(String key) => _preferences.remove(key);
}
