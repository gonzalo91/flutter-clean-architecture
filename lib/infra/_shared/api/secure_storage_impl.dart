import 'package:learning/core/_shared/api/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  late final FlutterSecureStorage storage;

  SecureStorageImpl() {
    storage = const FlutterSecureStorage();
  }

  @override
  Future<String?> get(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> put(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
