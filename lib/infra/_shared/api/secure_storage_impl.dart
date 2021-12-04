import 'package:learning/core/_shared/api/secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  @override
  Future get(String key) {
    return Future.value('ok');
  }

  @override
  Future put(String key, value) {
    throw UnimplementedError();
  }
}
