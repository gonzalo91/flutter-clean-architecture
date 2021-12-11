import 'dart:io';

import 'package:hive/hive.dart';
import 'package:learning/core/_shared/api/local_storage.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageImpl implements LocalStorage {
  bool openBox = false;
  late Box _storage;

  LocalStorageImpl() {}

  get storage async {
    if (!openBox) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      Hive..init(appDocPath);

      _storage = await Hive.openBox('general');
      openBox = true;
    }

    return _storage;
  }

  @override
  Future<String?> get(String key) async {
    var storage = await this.storage;

    return Future.value(storage.get(key));
  }

  @override
  Future<void> delete(String key) async {
    var storage = await this.storage;
    storage.delete(key);
  }

  @override
  Future<void> put(String key, String value) async {
    var storage = await this.storage;
    Future.value(storage.put(key, value));
  }
}
