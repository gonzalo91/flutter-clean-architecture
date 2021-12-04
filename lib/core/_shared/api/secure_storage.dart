abstract class SecureStorage {
  Future get(String key);

  Future put(String key, dynamic value);
}
