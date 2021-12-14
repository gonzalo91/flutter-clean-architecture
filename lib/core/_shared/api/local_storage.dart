abstract class LocalStorage {
  Future<String?> get(String key);

  Future<void> delete(String key);

  Future<void> put(String key, String value);
}
