import 'dart:convert';

class User {
  final int id;
  final String name;
  final String username;
  final String uuid;

  User(this.id, this.name, this.username, this.uuid);

  factory User.fromLocal(String json) {
    var jsonConverted = jsonDecode(json);

    return User((jsonConverted['id'] as int), jsonConverted['name'],
        jsonConverted['username'], jsonConverted['uuid']);
  }

  String toLocal() {
    return jsonEncode({
      'id': id,
      'name': name,
      'username': username,
      'uuid': uuid,
    });
  }
}
