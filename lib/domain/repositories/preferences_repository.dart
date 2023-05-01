abstract class PreferencesRepository {
  // Write string to local storage SharedPreferences
  Future<bool> setString(String key, String data);

  // Get value from local storage SharedPreferences
  String? getString(String key);

  // Remove value from local storage SharedPreferences
  void remove(String key);
}
