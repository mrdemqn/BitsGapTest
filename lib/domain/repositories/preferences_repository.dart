abstract class PreferencesRepository {
  Future<bool> setString(String key, String data);

  String? getString(String key);
  
  void remove(String key);
}
